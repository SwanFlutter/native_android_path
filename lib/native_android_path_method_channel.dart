import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_android_path_platform_interface.dart';

/// An implementation of [NativeAndroidPathPlatform] that uses method channels.
class MethodChannelNativeAndroidPath extends NativeAndroidPathPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_android_path');

  @override
  Future<String?> getPlatformVersion() async {
    try {
      final String? version = await methodChannel.invokeMethod<String>(
        'getPlatformVersion',
      );
      return version;
    } on PlatformException catch (e) {
      debugPrint('Error getting platform version: ${e.message}');
      return null;
    }
  }

  @override
  Future<Map<String, String?>> getAllPaths() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?.map(
            (key, value) => MapEntry(key.toString(), value?.toString()),
          ) ??
          {};
    } on PlatformException catch (e) {
      debugPrint('Error getting all paths: ${e.message}');
      return <String, String?>{};
    }
  }

  @override
  Future<String?> getInternalStoragePath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      return await methodChannel.invokeMethod('getInternalStoragePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting internal storage path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getExternalStoragePath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      return await methodChannel.invokeMethod('getExternalStoragePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting external storage path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getInternalCachePath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      return await methodChannel.invokeMethod('getInternalCachePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting internal cache path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getExternalCachePath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      return await methodChannel.invokeMethod('getExternalCachePath');
    } on PlatformException catch (e) {
      debugPrint('Error getting external cache path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getDownloadPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      return await methodChannel.invokeMethod('getDownloadPath');
    } on PlatformException catch (e) {
      debugPrint('Error getting download path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getDCIMPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['dcim']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting DCIM path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getPicturesPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['pictures']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting pictures path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getMoviesPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['movies']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting movies path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getMusicPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['music']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting music path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getRingtonesPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['ringtones']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting ringtones path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getAlarmsPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['alarms']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting alarms path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getNotificationsPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['notifications']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting notifications path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getDocumentsPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['documents']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting documents path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getPodcastsPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['podcasts']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting podcasts path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getScreenshotsPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['screenshots']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting screenshots path: ${e.message}');
      return null;
    }
  }

  @override
  Future<String?> getAudiobooksPath() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final Map<dynamic, dynamic>? result = await methodChannel.invokeMethod(
        'getAllPaths',
      );
      return result?['audiobooks']?.toString();
    } on PlatformException catch (e) {
      debugPrint('Error getting audiobooks path: ${e.message}');
      return null;
    }
  }

  @override
  Future<bool> isExternalStorageWritable() async {
    try {
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final bool result = await methodChannel.invokeMethod(
        'isExternalStorageWritable',
      );
      return result;
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
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final bool result = await methodChannel.invokeMethod(
        'isExternalStorageReadable',
      );
      return result;
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
      if (!Platform.isAndroid) {
        throw PlatformException(
          code: 'UNSUPPORTED_PLATFORM',
          message: 'This method is only supported on Android.',
        );
      }
      final List<dynamic>? result = await methodChannel.invokeMethod(
        'getExternalStorageDirectories',
        {'type': type},
      );
      return result?.map((path) => path.toString()).toList() ?? [];
    } on PlatformException catch (e) {
      debugPrint('Error getting external storage directories: ${e.message}');
      return [];
    }
  }
}
