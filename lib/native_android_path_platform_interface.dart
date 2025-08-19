import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_android_path_method_channel.dart';

abstract class NativeAndroidPathPlatform extends PlatformInterface {
  // Constructs a NativeAndroidPathPlatform.
  NativeAndroidPathPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeAndroidPathPlatform _instance = MethodChannelNativeAndroidPath();

  /// The default instance of [NativeAndroidPathPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeAndroidPath].
  static NativeAndroidPathPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeAndroidPathPlatform] when
  /// they register themselves.
  static set instance(NativeAndroidPathPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, String?>> getAllPaths() {
    throw UnimplementedError('getAllPaths() has not been implemented.');
  }

  Future<String?> getInternalStoragePath() {
    throw UnimplementedError(
      'getInternalStoragePath() has not been implemented.',
    );
  }

  Future<String?> getExternalStoragePath() {
    throw UnimplementedError(
      'getExternalStoragePath() has not been implemented.',
    );
  }

  Future<String?> getInternalCachePath() {
    throw UnimplementedError(
      'getInternalCachePath() has not been implemented.',
    );
  }

  Future<String?> getExternalCachePath() {
    throw UnimplementedError(
      'getExternalCachePath() has not been implemented.',
    );
  }

  Future<String?> getDownloadPath() {
    throw UnimplementedError('getDownloadPath() has not been implemented.');
  }

  Future<String?> getDCIMPath() {
    throw UnimplementedError('getDCIMPath() has not been implemented.');
  }

  Future<String?> getPicturesPath() {
    throw UnimplementedError('getPicturesPath() has not been implemented.');
  }

  Future<String?> getMoviesPath() {
    throw UnimplementedError('getMoviesPath() has not been implemented.');
  }

  Future<String?> getMusicPath() {
    throw UnimplementedError('getMusicPath() has not been implemented.');
  }

  Future<String?> getRingtonesPath() {
    throw UnimplementedError('getRingtonesPath() has not been implemented.');
  }

  Future<String?> getAlarmsPath() {
    throw UnimplementedError('getAlarmsPath() has not been implemented.');
  }

  Future<String?> getNotificationsPath() {
    throw UnimplementedError(
      'getNotificationsPath() has not been implemented.',
    );
  }

  Future<String?> getDocumentsPath() {
    throw UnimplementedError('getDocumentsPath() has not been implemented.');
  }

  Future<String?> getPodcastsPath() {
    throw UnimplementedError('getPodcastsPath() has not been implemented.');
  }

  Future<String?> getScreenshotsPath() {
    throw UnimplementedError('getScreenshotsPath() has not been implemented.');
  }

  Future<String?> getAudiobooksPath() {
    throw UnimplementedError('getAudiobooksPath() has not been implemented.');
  }

  Future<bool> isExternalStorageWritable() {
    throw UnimplementedError(
      'isExternalStorageWritable() has not been implemented.',
    );
  }

  Future<bool> isExternalStorageReadable() {
    throw UnimplementedError(
      'isExternalStorageReadable() has not been implemented.',
    );
  }

  Future<List<String>> getExternalStorageDirectories(String type) {
    throw UnimplementedError(
      'getExternalStorageDirectories() has not been implemented.',
    );
  }
}
