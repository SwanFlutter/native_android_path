# NativeAndroidPath

A Flutter plugin that provides access to various storage paths on Android devices.

## Installation

* By default, permissions are enabled, so there’s no need to declare them in the AndroidManifest.xml file.

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  native_android_path: ^latest_version
```

```yaml
dependencies:
  native_android_path: ^0.0.2
```

Then run:

```bash
flutter pub get add native_android_path
```

## Usage

Import the package:

```dart
import 'package:native_android_path/native_android_path.dart';
```

Create an instance of the `NativeAndroidPath` class:

```dart

final nativeAndroidPath = NativeAndroidPath();

```

![android_path](https://github.com/user-attachments/assets/3de1ec77-1b88-4ef5-baf4-90e5fccabb4f)


## Methods

### `getPlatformVersion()`

Returns the version of the Android platform.

**Example:**

```dart
Future<void> getAndroidVersion() async {
  try {
    String? version = await NativeAndroidPath().getPlatformVersion();
    print('Android version: $version');
  } catch (e) {
    print('Error getting Android version: $e');
  }
}
```

### `getAllPaths()`

Returns all available storage paths on the device as a map.

**Example:**

```dart
Future<void> showAllPaths() async {
  try {
    Map<String, String?> paths = await NativeAndroidPath().getAllPaths();
    paths.forEach((key, value) {
      print('$key: $value');
    });
  } catch (e) {
    print('Error getting all paths: $e');
  }
}
```

### `getInternalStoragePath()`

Returns the path to the internal storage directory.

**Example:**

```dart
Future<void> showInternalStorage() async {
  try {
    String? path = await NativeAndroidPath().getInternalStoragePath();
    print('Internal storage path: $path');
  } catch (e) {
    print('Error getting internal storage path: $e');
  }
}
```

### `getExternalStoragePath()`

Returns the path to the external storage directory.

**Example:**

```dart
Future<void> showExternalStorage() async {
  try {
    String? path = await NativeAndroidPath().getExternalStoragePath();
    print('External storage path: $path');
  } catch (e) {
    print('Error getting external storage path: $e');
  }
}
```

### `getInternalCachePath()`

Returns the path to the internal cache directory.

**Example:**

```dart
Future<void> showInternalCache() async {
  try {
    String? path = await NativeAndroidPath().getInternalCachePath();
    print('Internal cache path: $path');
  } catch (e) {
    print('Error getting internal cache path: $e');
  }
}
```

### `getExternalCachePath()`

Returns the path to the external cache directory.

**Example:**

```dart
Future<void> showExternalCache() async {
  try {
    String? path = await NativeAndroidPath().getExternalCachePath();
    print('External cache path: $path');
  } catch (e) {
    print('Error getting external cache path: $e');
  }
}
```

### `getDownloadPath()`

Returns the path to the downloads directory.

**Example:**

```dart
Future<void> showDownloadsFolder() async {
  try {
    String? path = await NativeAndroidPath().getDownloadPath();
    print('Downloads path: $path');
  } catch (e) {
    print('Error getting downloads path: $e');
  }
}
```

### `getDCIMPath()`

Returns the path to the DCIM directory (camera photos).

**Example:**

```dart
Future<void> showDCIMFolder() async {
  try {
    String? path = await NativeAndroidPath().getDCIMPath();
    print('DCIM path: $path');
  } catch (e) {
    print('Error getting DCIM path: $e');
  }
}
```

### `getPicturesPath()`

Returns the path to the pictures directory.

**Example:**

```dart
Future<void> showPicturesFolder() async {
  try {
    String? path = await NativeAndroidPath().getPicturesPath();
    print('Pictures path: $path');
  } catch (e) {
    print('Error getting pictures path: $e');
  }
}
```

### `getMoviesPath()`

Returns the path to the movies directory.

**Example:**

```dart
Future<void> showMoviesFolder() async {
  try {
    String? path = await NativeAndroidPath().getMoviesPath();
    print('Movies path: $path');
  } catch (e) {
    print('Error getting movies path: $e');
  }
}
```

### `getMusicPath()`

Returns the path to the music directory.

**Example:**

```dart
Future<void> showMusicFolder() async {
  try {
    String? path = await NativeAndroidPath().getMusicPath();
    print('Music path: $path');
  } catch (e) {
    print('Error getting music path: $e');
  }
}
```

### `getRingtonesPath()`

Returns the path to the ringtones directory.

**Example:**

```dart
Future<void> showRingtonesFolder() async {
  try {
    String? path = await NativeAndroidPath().getRingtonesPath();
    print('Ringtones path: $path');
  } catch (e) {
    print('Error getting ringtones path: $e');
  }
}
```

### `getAlarmsPath()`

Returns the path to the alarms directory.

**Example:**

```dart
Future<void> showAlarmsFolder() async {
  try {
    String? path = await NativeAndroidPath().getAlarmsPath();
    print('Alarms path: $path');
  } catch (e) {
    print('Error getting alarms path: $e');
  }
}
```

### `getNotificationsPath()`

Returns the path to the notifications directory.

**Example:**

```dart
Future<void> showNotificationsFolder() async {
  try {
    String? path = await NativeAndroidPath().getNotificationsPath();
    print('Notifications path: $path');
  } catch (e) {
    print('Error getting notifications path: $e');
  }
}
```

### `getDocumentsPath()`

Returns the path to the documents directory.

**Example:**

```dart
Future<void> showDocumentsFolder() async {
  try {
    String? path = await NativeAndroidPath().getDocumentsPath();
    print('Documents path: $path');
  } catch (e) {
    print('Error getting documents path: $e');
  }
}
```

### `isExternalStorageWritable()`

Checks if external storage is writable.

**Example:**

```dart
Future<void> checkExternalStorageWritable() async {
  try {
    bool isWritable = await NativeAndroidPath().isExternalStorageWritable();
    print('External storage is writable: $isWritable');
  } catch (e) {
    print('Error checking if external storage is writable: $e');
  }
}
```

### `isExternalStorageReadable()`

Checks if external storage is readable.

**Example:**

```dart
Future<void> checkExternalStorageReadable() async {
  try {
    bool isReadable = await NativeAndroidPath().isExternalStorageReadable();
    print('External storage is readable: $isReadable');
  } catch (e) {
    print('Error checking if external storage is readable: $e');
  }
}
```

### `getExternalStorageDirectories(String type)`

Returns a list of external storage directory paths for the specified type.

**Example:**

```dart
Future<void> getSpecificExternalDirectories() async {
  try {
    // Possible types: "music", "pictures", "movies", "documents", etc.
    List<String> paths = await NativeAndroidPath().getExternalStorageDirectories("pictures");
    print('External picture directories:');
    for (String path in paths) {
      print('- $path');
    }
  } catch (e) {
    print('Error getting external directories: $e');
  }
}
```

## Full Example

Here's a complete example showing how to use multiple methods:

```dart
import 'package:flutter/material.dart';
import 'package:native_android_path/native_android_path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NativeAndroidPath _pathPlugin = NativeAndroidPath();
  Map<String, String> _paths = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPaths();
  }

  Future<void> _loadPaths() async {
    try {
      Map<String, String?> allPaths = await _pathPlugin.getAllPaths();
      bool isWritable = await _pathPlugin.isExternalStorageWritable();
      bool isReadable = await _pathPlugin.isExternalStorageReadable();
      
      setState(() {
        _paths = {
          ...allPaths.map((key, value) => MapEntry(key, value ?? 'Not available')),
          'External storage writable': isWritable.toString(),
          'External storage readable': isReadable.toString(),
        };
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _paths = {'Error': e.toString()};
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Android Storage Paths'),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _paths.length,
                itemBuilder: (context, index) {
                  String key = _paths.keys.elementAt(index);
                  String value = _paths[key]!;
                  return ListTile(
                    title: Text(key),
                    subtitle: Text(value),
                  );
                },
              ),
      ),
    );
  }
}
```

## Permissions


For Android 10 (API level 29) and above, you might need to add:

```xml
<application
    android:requestLegacyExternalStorage="true"
  
>
```

For Android 11 (API level 30) and above, consider implementing more specific storage access using the Storage Access Framework or Media Store API.


### **Required Permissions for Android 13**

1. **General Permissions**:
    - To access external files, you still need the `READ_EXTERNAL_STORAGE` and `WRITE_EXTERNAL_STORAGE` permissions.

   ```xml
   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
   <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
   ```

2. **Specific Permissions for Android 13**:
    - In Android 13, access to media files (such as photos, videos, and music) is controlled separately. To access these files, you must use **specific permissions**:
        - `READ_MEDIA_IMAGES`: For accessing photos.
        - `READ_MEDIA_VIDEO`: For accessing videos.
        - `READ_MEDIA_AUDIO`: For accessing audio files.

   ```xml
   <uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
   <uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />
   <uses-permission android:name="android.permission.READ_MEDIA_AUDIO" />
   ```

3. **Requesting Permissions at Runtime**:
    - In Android 13, you must request specific permissions at runtime from the user. This is done using `ActivityResultContracts.RequestPermission` or `ActivityResultContracts.RequestMultiplePermissions`.

   Example of requesting permission to access photos:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:permission_master/permission_master.dart';

   Future<void> requestMediaPermissions() async {
     final permissionMaster = PermissionMaster();
     final status = await permissionMaster.requestStoragePermission();

     if (status == PermissionStatus.granted) {
       print('Media permissions granted');
     } else if (status == PermissionStatus.openSettings) {
       // Permanent denial, suggest opening app settings
       await permissionMaster.openAppSettings();
     } else {
       print('Media permissions denied');
     }
   }
   ```

---

### **`AndroidManifest.xml` Settings for Android 13**

To support Android 13, your `AndroidManifest.xml` file should look like this:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.yourapp">

    <application
      **  android:requestLegacyExternalStorage="true"  **
        android:label="Your App"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
```

---

### **Important Changes for Android 13**

1. **Removal of `requestLegacyExternalStorage`**:
    - In Android 11 (API level 30) and above, the `requestLegacyExternalStorage` attribute was used to maintain compatibility with the old file system. However, in Android 13, this attribute **is no longer supported**, and you must use **specific permissions** instead.

2. **Use of `MediaStore`**:
    - To access media files in Android 13, you must use `MediaStore`. This API allows you to access photo, video, and music files.

---

## Additional information

If you have any issues, questions, or suggestions related to this package, please feel free to contact us at [swan.dev1993@gmail.com](mailto:zagros.development.group@gmail.com). We welcome your feedback and will do our best to address any problems or provide assistance.

For more information about this package, you can also visit our [GitHub repository](https://github.com/SwanFlutter/native_android_path) where you can find additional resources, contribute to the package's development, and file issues or bug reports. We appreciate your contributions and feedback, and we aim to make this package as useful as possible for our users.

Thank you for using our package, and we look forward to hearing from you!






