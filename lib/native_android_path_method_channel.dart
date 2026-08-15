import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_android_path_platform_interface.dart';

/// An implementation of [NativeAndroidPathPlatform] that uses method channels.

class MethodChannelNativeAndroidPath extends NativeAndroidPathPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('native_android_path');

  @override
  Future<String?> getPlatformVersion() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getPlatformVersion');
    } on PlatformException catch (e) {
      debugPrint('Error getting platform version: ${e.message}');
      return null;
    }
  }

  @override
  Future<Map<String, String?>> getAllPaths() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      final result = await methodChannel.invokeMapMethod<String, String?>(
        'getAllPaths',
      );
      return result ?? {};
    } on PlatformException catch (e) {
      debugPrint('Error getting all paths: ${e.message}');
      return {};
    }
  }

  @override
  Future<String?> getInternalStoragePath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getInternalStoragePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting internal storage path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getExternalStoragePath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getExternalStoragePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting external storage path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getInternalCachePath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getInternalCachePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting internal cache path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getExternalCachePath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getExternalCachePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting external cache path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getDownloadPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getDownloadPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting download path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getDCIMPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getDCIMPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting DCIM path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getPicturesPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getPicturesPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting pictures path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getMoviesPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getMoviesPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting movies path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getMusicPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getMusicPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting music path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getRingtonesPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getRingtonesPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting ringtones path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getAlarmsPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getAlarmsPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting alarms path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getNotificationsPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getNotificationsPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting notifications path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getDocumentsPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getDocumentsPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting documents path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getPodcastsPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getPodcastsPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting podcasts path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getScreenshotsPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getScreenshotsPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting screenshots path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getAudiobooksPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>('getAudiobooksPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting audiobooks path: ${e.message}');
      return null;
    }
  }

  @override
  Future<bool> isExternalStorageWritable() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<bool>(
            'isExternalStorageWritable',
          ) ??
          false;
    } on PlatformException catch (e) {
      debugPrint(
        'Error checking if external storage is writable: ${e.message}',
      );
      return false;
    }
  }

  @override
  Future<bool> isExternalStorageReadable() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<bool>(
            'isExternalStorageReadable',
          ) ??
          false;
    } on PlatformException catch (e) {
      debugPrint(
        'Error checking if external storage is readable: ${e.message}',
      );
      return false;
    }
  }

  @override
  Future<List<String>> getExternalStorageDirectories(String type) async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      final result = await methodChannel.invokeListMethod<String>(
        'getExternalStorageDirectories',
        {'type': type},
      );
      return result ?? [];
    } on PlatformException catch (e) {
      debugPrint('Error getting external storage directories: ${e.message}');
      return [];
    }
  }

  @override
  Future<String?> getRootInstallationPath() async {
    try {
      if (!Platform.isAndroid) throw _unsupportedPlatformException();
      return await methodChannel.invokeMethod<String>(
        'getRootInstallationPath',
      );
    } on PlatformException catch (e) {
      debugPrint('Error getting root installation path: ${e.message}');
      return null;
    }
  }

  PlatformException _unsupportedPlatformException() {
    return PlatformException(
      code: 'UNSUPPORTED_PLATFORM',
      message: 'This method is only supported on Android.',
    );
  }
}
