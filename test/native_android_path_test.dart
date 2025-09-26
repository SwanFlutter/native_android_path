import 'package:flutter_test/flutter_test.dart';
import 'package:native_android_path/native_android_path.dart';
import 'package:native_android_path/native_android_path_method_channel.dart';
import 'package:native_android_path/native_android_path_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeAndroidPathPlatform
    with MockPlatformInterfaceMixin
    implements NativeAndroidPathPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getAlarmsPath() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String?>> getAllPaths() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getAudiobooksPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getDCIMPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getDocumentsPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getDownloadPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getExternalCachePath() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getExternalStorageDirectories(String type) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getExternalStoragePath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getInternalCachePath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getInternalStoragePath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getMoviesPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getMusicPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getNotificationsPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getPicturesPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getPodcastsPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getRingtonesPath() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getScreenshotsPath() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isExternalStorageReadable() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isExternalStorageWritable() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getRootInstallationPath() {
    throw UnimplementedError();
  }
}

void main() {
  final NativeAndroidPathPlatform initialPlatform =
      NativeAndroidPathPlatform.instance;

  test('$MethodChannelNativeAndroidPath is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeAndroidPath>());
  });

  test('getPlatformVersion', () async {
    NativeAndroidPath nativeAndroidPathPlugin = NativeAndroidPath();
    MockNativeAndroidPathPlatform fakePlatform =
        MockNativeAndroidPathPlatform();
    NativeAndroidPathPlatform.instance = fakePlatform;

    expect(await nativeAndroidPathPlugin.getPlatformVersion(), '42');
  });
}
