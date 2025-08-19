import 'native_android_path_platform_interface.dart';

class NativeAndroidPath {
  /// Returns the version of the Android platform.
  ///
  /// This method retrieves the Android operating system version as a string.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? platformVersion = await NativeAndroidPath().getPlatformVersion();
  /// print('Android Version: $platformVersion');
  ///
  ///
  /// ```
  Future<String?> getPlatformVersion() {
    return NativeAndroidPathPlatform.instance.getPlatformVersion();
  }

  /// Returns all available storage paths on the device.
  ///
  /// This method returns a map of path names to storage paths.
  /// Returns an empty map if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// Map<String, String?> paths = await NativeAndroidPath().getAllPaths();
  /// paths.forEach((key, value) {
  ///   print('$key: $value');
  /// });
  ///
  ///
  /// ```
  Future<Map<String, String?>> getAllPaths() {
    return NativeAndroidPathPlatform.instance.getAllPaths();
  }

  /// Returns the path to the internal storage directory.
  ///
  /// This method retrieves the full path to the device's internal storage directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? internalPath = await NativeAndroidPath().getInternalStoragePath();
  /// print('Internal Storage Path: $internalPath');
  ///
  ///
  /// ```
  Future<String?> getInternalStoragePath() {
    return NativeAndroidPathPlatform.instance.getInternalStoragePath();
  }

  /// Returns the path to the external storage directory (SD card).
  ///
  /// This method retrieves the full path to the device's external storage directory (SD card).
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? externalPath = await NativeAndroidPath().getExternalStoragePath();
  /// print('External Storage Path: $externalPath');
  ///
  ///
  /// ```
  Future<String?> getExternalStoragePath() {
    return NativeAndroidPathPlatform.instance.getExternalStoragePath();
  }

  /// Returns the path to the internal cache directory.
  ///
  /// This method retrieves the full path to the device's internal cache directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? internalCachePath = await NativeAndroidPath().getInternalCachePath();
  /// print('Internal Cache Path: $internalCachePath');
  ///
  ///
  /// ```
  Future<String?> getInternalCachePath() {
    return NativeAndroidPathPlatform.instance.getInternalCachePath();
  }

  /// Returns the path to the external cache directory.
  ///
  /// This method retrieves the full path to the device's external cache directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? externalCachePath = await NativeAndroidPath().getExternalCachePath();
  /// print('External Cache Path: $externalCachePath');
  ///
  ///
  /// ```
  Future<String?> getExternalCachePath() {
    return NativeAndroidPathPlatform.instance.getExternalCachePath();
  }

  /// Returns the path to the downloads directory.
  ///
  /// This method retrieves the full path to the downloads directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? downloadPath = await NativeAndroidPath().getDownloadPath();
  /// print('Download Path: $downloadPath');
  ///
  ///
  /// ```
  Future<String?> getDownloadPath() {
    return NativeAndroidPathPlatform.instance.getDownloadPath();
  }

  /// Returns the path to the DCIM (Camera photos and videos) directory.
  ///
  /// This method retrieves the full path to the DCIM directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? dcimPath = await NativeAndroidPath().getDCIMPath();
  /// print('DCIM Path: $dcimPath');
  ///
  ///
  /// ```
  Future<String?> getDCIMPath() {
    return NativeAndroidPathPlatform.instance.getDCIMPath();
  }

  /// Returns the path to the Pictures directory.
  ///
  /// This method retrieves the full path to the Pictures directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? picturesPath = await NativeAndroidPath().getPicturesPath();
  /// print('Pictures Path: $picturesPath');
  ///
  ///
  /// ```
  Future<String?> getPicturesPath() {
    return NativeAndroidPathPlatform.instance.getPicturesPath();
  }

  /// Returns the path to the Movies directory.
  ///
  /// This method retrieves the full path to the Movies directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? moviesPath = await NativeAndroidPath().getMoviesPath();
  /// print('Movies Path: $moviesPath');
  ///
  ///
  /// ```
  Future<String?> getMoviesPath() {
    return NativeAndroidPathPlatform.instance.getMoviesPath();
  }

  /// Returns the path to the Music directory.
  ///
  /// This method retrieves the full path to the Music directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? musicPath = await NativeAndroidPath().getMusicPath();
  /// print('Music Path: $musicPath');
  ///
  ///
  /// ```
  Future<String?> getMusicPath() {
    return NativeAndroidPathPlatform.instance.getMusicPath();
  }

  /// Returns the path to the Ringtones directory.
  ///
  /// This method retrieves the full path to the Ringtones directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? ringtonesPath = await NativeAndroidPath().getRingtonesPath();
  /// print('Ringtones Path: $ringtonesPath');
  ///
  ///
  /// ```
  Future<String?> getRingtonesPath() {
    return NativeAndroidPathPlatform.instance.getRingtonesPath();
  }

  /// Returns the path to the Alarms directory.
  ///
  /// This method retrieves the full path to the Alarms directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? alarmsPath = await NativeAndroidPath().getAlarmsPath();
  /// print('Alarms Path: $alarmsPath');
  ///
  ///
  /// ```
  Future<String?> getAlarmsPath() {
    return NativeAndroidPathPlatform.instance.getAlarmsPath();
  }

  /// Returns the path to the Notifications directory.
  ///
  /// This method retrieves the full path to the Notifications directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? notificationsPath = await NativeAndroidPath().getNotificationsPath();
  /// print('Notifications Path: $notificationsPath');
  ///
  ///
  /// ```
  Future<String?> getNotificationsPath() {
    return NativeAndroidPathPlatform.instance.getNotificationsPath();
  }

  /// Returns the path to the Documents directory.
  ///
  /// This method retrieves the full path to the Documents directory.
  /// Returns null if an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? documentsPath = await NativeAndroidPath().getDocumentsPath();
  /// print('Documents Path: $documentsPath');
  ///
  ///
  /// ```
  Future<String?> getDocumentsPath() {
    return NativeAndroidPathPlatform.instance.getDocumentsPath();
  }

  /// Returns the path to the Podcasts directory.
  ///
  /// This method retrieves the full path to the Podcasts directory on the device.
  /// Returns null if the directory is not found or an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? podcastsPath = await NativeAndroidPath().getPodcastsPath();
  /// if (podcastsPath != null) {
  ///   print('Podcasts Path: $podcastsPath');
  /// } else {
  ///   print('Podcasts directory not found or an error occurred.');
  /// }
  ///
  ///
  /// ```
  Future<String?> getPodcastsPath() {
    return NativeAndroidPathPlatform.instance.getPodcastsPath();
  }

  /// Returns the path to the Screenshots directory.
  ///
  /// This method retrieves the full path to the Screenshots directory on the device.
  /// Returns null if the directory is not found or an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? screenshotsPath = await NativeAndroidPath().getScreenshotsPath();
  /// if (screenshotsPath != null) {
  ///   print('Screenshots Path: $screenshotsPath');
  /// } else {
  ///   print('Screenshots directory not found or an error occurred.');
  /// }
  ///
  ///
  /// ```
  Future<String?> getScreenshotsPath() {
    return NativeAndroidPathPlatform.instance.getScreenshotsPath();
  }

  /// Returns the path to the Audiobooks directory.
  ///
  /// This method retrieves the full path to the Audiobooks directory on the device.
  /// Returns null if the directory is not found or an error occurs.
  ///
  /// Example:
  /// ```dart
  /// String? audiobooksPath = await NativeAndroidPath().getAudiobooksPath();
  /// if (audiobooksPath != null) {
  ///   print('Audiobooks Path: $audiobooksPath');
  /// } else {
  ///   print('Audiobooks directory not found or an error occurred.');
  /// }
  ///
  ///
  /// ```
  Future<String?> getAudiobooksPath() {
    return NativeAndroidPathPlatform.instance.getAudiobooksPath();
  }

  /// Checks if external storage is writable.
  ///
  /// This method checks if the external storage (SD card) is writable.
  /// Returns true if writable, false otherwise.
  ///
  /// Example:
  /// ```dart
  /// bool isWritable = await NativeAndroidPath().isExternalStorageWritable();
  /// print('External Storage Writable: $isWritable');
  ///
  ///
  /// ```
  Future<bool> isExternalStorageWritable() {
    return NativeAndroidPathPlatform.instance.isExternalStorageWritable();
  }

  /// Checks if external storage is readable.
  ///
  /// This method checks if the external storage (SD card) is readable.
  /// Returns true if readable, false otherwise.
  ///
  /// Example:
  /// ```dart
  /// bool isReadable = await NativeAndroidPath().isExternalStorageReadable();
  /// print('External Storage Readable: $isReadable');
  ///
  ///
  /// ```
  ///
  Future<bool> isExternalStorageReadable() {
    return NativeAndroidPathPlatform.instance.isExternalStorageReadable();
  }

  /// Returns a list of external storage directory paths for the specified type.
  ///
  /// This method retrieves a list of paths to external storage directories (SD card)
  /// for a given storage type. The `type` parameter specifies the type of directory,
  /// such as "Pictures", "Movies", "Music", etc.
  ///
  /// Returns a list of strings representing the paths, or an empty list if no paths are found
  /// or an error occurs.
  ///
  /// Example:
  /// ```dart
  /// List<String> picturePaths = await NativeAndroidPath().getExternalStorageDirectories("Pictures");
  /// if (picturePaths.isNotEmpty) {
  ///   picturePaths.forEach((path) {
  ///     print('Picture Path: $path');
  ///   });
  /// } else {
  ///   print('No external Picture directories found.');
  /// }
  ///
  ///
  /// ```
  ///
  /// Parameters:
  ///   - `type`: The type of storage directory (e.g., "Pictures", "Movies", "Music").
  Future<List<String>> getExternalStorageDirectories(String type) {
    return NativeAndroidPathPlatform.instance.getExternalStorageDirectories(
      type,
    );
  }
}
