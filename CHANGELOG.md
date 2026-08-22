
---

## 1.0.1

* **Fix:** Added `android/gradle.properties` with `kotlin.incremental=false` to resolve a
  cross-drive Kotlin incremental compilation crash on Windows. The crash occurred when the
  Flutter Pub Cache (`C:\Users\...\AppData\Local\Pub\Cache`) and the Flutter project
  (e.g. `G:\Android\...`) reside on **different drives**. Kotlin's incremental compiler uses
  `File.relativeTo()` to store source paths, which throws `IllegalArgumentException: this and
  base files have different roots` when the two paths span different Windows drive letters.
* **Fix:** Pinned Kotlin Gradle Plugin (KGP) to `2.1.21` (downgraded from `2.2.20`) to match
  the tested-compatible combination: AGP `8.7.3` + Gradle `8.11.1` + KGP `2.1.21`. KGP `2.2.x`
  causes `AssertionError` / daemon crashes (`Could not close incremental caches`) under the same
  cross-drive condition.

---

## 1.0.0

* Updates minimum supported SDK version to Flutter 3.44 / Dart 3.12.
* Migrates Android plugin to built-in Kotlin (removes legacy KGP apply).

---

## 0.0.5

* Added `getRootInstallationPath()` method to retrieve the root installation path where applications are installed (typically `/data`).
* Updated `getAllPaths()` to include the new root installation path.
* Enhanced Android native implementation to support root installation path retrieval.

---

## 0.0.4

* Fix pub point.

---

## 0.0.3

* Update Sdk.
* By defau

---

## 0.0.2

* Fix bug path directory.


lt, permissions are enabled, so there's no need to declare them in the AndroidManifest.xml file.

---

## 0.0.1

* initial release.




