import 'package:flutter_test/flutter_test.dart';
import 'package:native_android_path/native_android_path.dart';
import 'package:native_android_path/native_android_path_platform_interface.dart';
import 'package:native_android_path/native_android_path_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeAndroidPathPlatform
    with MockPlatformInterfaceMixin
    implements NativeAndroidPathPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getAlarmsPath() {
    // TODO: implement getAlarmsPath
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String?>> getAllPaths() {
    // TODO: implement getAllPaths
    throw UnimplementedError();
  }

  @override
  Future<String?> getAudiobooksPath() {
    // TODO: implement getAudiobooksPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getDCIMPath() {
    // TODO: implement getDCIMPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getDocumentsPath() {
    // TODO: implement getDocumentsPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getDownloadPath() {
    // TODO: implement getDownloadPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getExternalCachePath() {
    // TODO: implement getExternalCachePath
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getExternalStorageDirectories(String type) {
    // TODO: implement getExternalStorageDirectories
    throw UnimplementedError();
  }

  @override
  Future<String?> getExternalStoragePath() {
    // TODO: implement getExternalStoragePath
    throw UnimplementedError();
  }

  @override
  Future<String?> getInternalCachePath() {
    // TODO: implement getInternalCachePath
    throw UnimplementedError();
  }

  @override
  Future<String?> getInternalStoragePath() {
    // TODO: implement getInternalStoragePath
    throw UnimplementedError();
  }

  @override
  Future<String?> getMoviesPath() {
    // TODO: implement getMoviesPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getMusicPath() {
    // TODO: implement getMusicPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getNotificationsPath() {
    // TODO: implement getNotificationsPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getPicturesPath() {
    // TODO: implement getPicturesPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getPodcastsPath() {
    // TODO: implement getPodcastsPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getRingtonesPath() {
    // TODO: implement getRingtonesPath
    throw UnimplementedError();
  }

  @override
  Future<String?> getScreenshotsPath() {
    // TODO: implement getScreenshotsPath
    throw UnimplementedError();
  }

  @override
  Future<bool> isExternalStorageReadable() {
    // TODO: implement isExternalStorageReadable
    throw UnimplementedError();
  }

  @override
  Future<bool> isExternalStorageWritable() {
    // TODO: implement isExternalStorageWritable
    throw UnimplementedError();
  }
}

void main() {
  final NativeAndroidPathPlatform initialPlatform = NativeAndroidPathPlatform.instance;

  test('$MethodChannelNativeAndroidPath is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeAndroidPath>());
  });

  test('getPlatformVersion', () async {
    NativeAndroidPath nativeAndroidPathPlugin = NativeAndroidPath();
    MockNativeAndroidPathPlatform fakePlatform = MockNativeAndroidPathPlatform();
    NativeAndroidPathPlatform.instance = fakePlatform;

    expect(await nativeAndroidPathPlugin.getPlatformVersion(), '42');
  });
}
