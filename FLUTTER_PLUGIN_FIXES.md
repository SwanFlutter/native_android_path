# Flutter Plugin Fixes — Windows Multi-Drive & Build Issues

A reference guide for fixes applied to `image_picker_master`.
Apply these to any Flutter plugin that shows the same symptoms.

---

## Fix 1 — Kotlin Cross-Drive Incremental Compilation Crash

### Symptom

```
java.lang.IllegalArgumentException: this and base files have different roots:
C:\Users\...\AppData\Local\Pub\Cache\...\SomePlugin.kt
and G:\Android\my_project\android
```

Full chain:
```
IncrementalCompilerRunner.compileNonIncrementally()
 └── IncrementalCachesManager.close()
      └── RelocatableFileToPathConverter.toPath()
           └── File.relativeTo(base)
                └── toRelativeString()
                     └── IllegalArgumentException: different roots
```

### Root Cause

Kotlin's incremental compiler stores source file paths as **relative paths**
using `File.relativeTo()`. On Windows, this fails when the Pub Cache
(`C:\Users\...\AppData\Local\Pub\Cache\`) and the Flutter project
(e.g. `G:\Android\...`) are on **different drives**. There is no relative
path between two different Windows drives.

### Fix — Add `android/gradle.properties` to the plugin

Create the file `android/gradle.properties` (next to `build.gradle.kts`):

```properties
# Disables Kotlin incremental compilation for this module.
# Fixes cross-drive build failure on Windows when Pub Cache (C:\) and
# Flutter project (e.g. G:\) are on different drives.
# This property is read directly by the Kotlin daemon — it is the only
# reliable way to disable incremental compilation at the module level.
kotlin.incremental=false
```

### Why NOT `compilerOptions { incremental = false }` in the task

```kotlin
// ❌ Does NOT work — KGP does not forward this flag to the daemon
tasks.withType<KotlinCompile>().configureEach {
    compilerOptions {
        incremental = false   // ignored by the daemon
    }
}
```

The Kotlin daemon reads `kotlin.incremental` from Gradle properties
**before** compilation starts. Task-level compiler options are not
forwarded to the daemon for this flag.

### Impact

- Build time: ~1–3 s extra per subsequent build for this module only.
- If the plugin has a single Kotlin file (most do), the impact is negligible.
- No effect on the host app's incremental compilation.

---

## Fix 2 — Corrupted Kotlin Incremental Cache (`descriptor.bin`)

### Symptom

```
Could not load module metadata from
C:\Users\...\gradle\caches\modules-2\metadata-2.107\descriptors\
com.android.tools.external.com-intellij\intellij-core\32.3.1\d4e3...\descriptor.bin
```

### Root Cause

Gradle module metadata cache is corrupted — usually after an interrupted
download or a Gradle/AGP version mismatch.

### Fix — Delete the corrupt cache entry

Run in PowerShell:

```powershell
# Delete the specific corrupt group
$group = "com.android.tools.external.com-intellij"
Remove-Item -Recurse -Force `
  "C:\Users\$env:USERNAME\.gradle\caches\modules-2\metadata-2.107\descriptors\$group"
Remove-Item -Recurse -Force `
  "C:\Users\$env:USERNAME\.gradle\caches\modules-2\files-2.1\$group"
```

If many modules are corrupt, wipe the entire modules-2 cache
(Gradle re-downloads everything on next build):

```powershell
Remove-Item -Recurse -Force `
  "C:\Users\$env:USERNAME\.gradle\caches\modules-2"
```

---

## Fix 3 — AGP / Gradle / Kotlin Version Mismatch

### Symptom

```
e: Daemon compilation failed
java.lang.AssertionError: Could not close incremental caches
Storage for [...class-fq-name-to-source.tab] is already registered
```

### Root Cause

Incompatible versions: AGP 9.x + Gradle 9.x + Kotlin 2.3.x (non-existent
version). The Kotlin daemon crashes and leaves cache files locked.

### Fix — Pin compatible versions in `android/build.gradle.kts`

```kotlin
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.7.3")          // AGP
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:2.1.21") // KGP
    }
}
```

And in `example/android/gradle/wrapper/gradle-wrapper.properties`:

```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.11.1-all.zip
```

### Tested compatible combination

| Component | Version |
|-----------|---------|
| Gradle wrapper | 8.11.1 |
| AGP (`com.android.tools.build:gradle`) | 8.7.3 |
| Kotlin Gradle Plugin | 2.1.21 |
| `compileSdk` | 35 or 36 |
| `jvmTarget` | JVM_17 |

---

## Fix 4 — Missing `file_paths.xml` (FileProvider resource not found)

### Symptom

```
AAPT: error: resource xml/file_paths (aka com.example.myapp:xml/file_paths) not found.
```

### Root Cause

The plugin's `AndroidManifest.xml` declares a `<provider>` with
`android:resource="@xml/file_paths"` but the file does not exist in
the plugin's `res/xml/` directory.

### Fix

1. Create `android/src/main/res/xml/file_paths.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="http://schemas.android.com/apk/res/android">
    <files-path          name="plugin_files"          path="." />
    <cache-path          name="plugin_cache"          path="." />
    <external-cache-path name="plugin_external_cache" path="." />
    <external-files-path name="plugin_external_files" path="." />
    <external-path       name="plugin_external"       path="." />
</paths>
```

2. Make sure `android/build.gradle.kts` includes `res` in `sourceSets`:

```kotlin
sourceSets {
    getByName("main") {
        java.srcDirs("src/main/kotlin")
        res.srcDirs("src/main/res")        // ← required
    }
}
```

---

## Fix 5 — `unawaited_futures` Lint Warning in Web Implementation

### Symptom (pub.dev static analysis)

```
warning: Returning a Future without await inside a try block.
lib/some_plugin_web.dart:410:7
    │
410 │       return loadCompleter.future;
    │       ^^^^^^
```

### Root Cause

An `async` method inside a `try/catch` block returns a `Future` without
`await`. If the Future throws later, the surrounding `catch` never sees it.

### Fix

```dart
// ❌ Before
return loadCompleter.future;

// ✅ After
return await loadCompleter.future;
```

---

## Fix 6 — Windows Plugin Crash When Using Background Threads

### Symptom

App closes silently on Windows when calling a method that uses
`std::thread` (e.g. image resize, crop).

### Root Cause

Flutter Windows SDK requires that `MethodResult::Success()` and
`MethodResult::Error()` are called **only from the platform (UI) thread**.
Calling them directly from a `std::thread` causes undefined behavior /
crash.

### Fix — Message-only window for thread marshalling

In the plugin `.h`, add:

```cpp
#include <mutex>
#include <functional>

// inside the class private section:
HWND     dispatch_hwnd_ = nullptr;
std::mutex pending_mutex_;
std::vector<std::function<void()>> pending_callbacks_;
void PostToMainThread(std::function<void()> fn);
```

In the plugin constructor (`.cpp`):

```cpp
// Create a message-only window for platform-thread dispatch
WNDCLASSW wc = {};
wc.lpfnWndProc = [](HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) -> LRESULT {
    if (msg == WM_APP + 1) {
        auto* plugin = reinterpret_cast<MyPlugin*>(
            GetWindowLongPtrW(hwnd, GWLP_USERDATA));
        if (plugin) {
            std::vector<std::function<void()>> cbs;
            {
                std::lock_guard<std::mutex> lk(plugin->pending_mutex_);
                cbs.swap(plugin->pending_callbacks_);
            }
            for (auto& fn : cbs) fn();
        }
        return 0;
    }
    return DefWindowProcW(hwnd, msg, wp, lp);
};
wc.hInstance     = GetModuleHandleW(nullptr);
wc.lpszClassName = L"MyPlugin_DispatchWindow";
RegisterClassW(&wc);
dispatch_hwnd_ = CreateWindowExW(0, L"MyPlugin_DispatchWindow", nullptr, 0,
    0, 0, 0, 0, HWND_MESSAGE, nullptr, GetModuleHandleW(nullptr), nullptr);
if (dispatch_hwnd_)
    SetWindowLongPtrW(dispatch_hwnd_, GWLP_USERDATA,
                       reinterpret_cast<LONG_PTR>(this));
```

In the destructor:

```cpp
if (dispatch_hwnd_) {
    DestroyWindow(dispatch_hwnd_);
    dispatch_hwnd_ = nullptr;
}
{
    std::lock_guard<std::mutex> lk(pending_mutex_);
    pending_callbacks_.clear();
}
```

`PostToMainThread` implementation:

```cpp
void MyPlugin::PostToMainThread(std::function<void()> fn) {
    if (!dispatch_hwnd_) { fn(); return; }
    {
        std::lock_guard<std::mutex> lk(pending_mutex_);
        pending_callbacks_.push_back(std::move(fn));
    }
    PostMessageW(dispatch_hwnd_, WM_APP + 1, 0, 0);
}
```

Usage inside `std::thread`:

```cpp
std::thread([this, shared_result, some_value]() {
    // ... do work ...

    // ✅ Marshal result back to platform thread
    PostToMainThread([shared_result, some_value]() {
        shared_result->Success(flutter::EncodableValue(some_value));
    });
}).detach();
```

### Additional: protect `temporary_files_` with a mutex

```cpp
// .h
std::mutex temp_files_mutex_;
std::vector<std::string> temporary_files_;

// .cpp — all push_back calls:
{
    std::lock_guard<std::mutex> lk(temp_files_mutex_);
    temporary_files_.push_back(path);
}

// .cpp — CleanupTempFiles():
std::lock_guard<std::mutex> lk(temp_files_mutex_);
for (const auto& f : temporary_files_) { ... }
temporary_files_.clear();
```

### Also add `#define NOMINMAX` before all includes

```cpp
// Top of .cpp and .h — prevents Windows.h min/max macros from
// conflicting with std::max / std::min
#define NOMINMAX
#include "my_plugin.h"
// ...
```

---

## Quick Checklist for a New Plugin on Windows

- [ ] `android/gradle.properties` exists with `kotlin.incremental=false`
- [ ] AGP ≤ 8.7.x, Gradle wrapper ≤ 8.11.x, KGP = 2.1.x
- [ ] `android/src/main/res/xml/file_paths.xml` exists (if using FileProvider)
- [ ] `res.srcDirs("src/main/res")` in `sourceSets`
- [ ] Web `async` methods `await` their Completers inside `try/catch`
- [ ] Windows background threads marshal results via `PostToMainThread`
- [ ] `temporary_files_` protected by `std::mutex`
- [ ] `#define NOMINMAX` before all includes in Windows `.cpp` / `.h`
