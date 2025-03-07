import 'package:flutter/material.dart';
import 'dart:async';
import 'package:native_android_path/native_android_path.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Android Path Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NativePathDemo(),
    );
  }
}

class NativePathDemo extends StatefulWidget {
  const NativePathDemo({super.key});

  @override
  State<NativePathDemo> createState() => _NativePathDemoState();
}

class _NativePathDemoState extends State<NativePathDemo> {
  final _nativeAndroidPath = NativeAndroidPath();
  String _result = 'Press a button to see the result';

  Future<void> _getPlatformVersion() async {
    try {
      final version = await _nativeAndroidPath.getPlatformVersion();
      setState(() {
        _result = 'Platform Version: ${version ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting platform version: $e';
      });
    }
  }

  Future<void> _getAllPaths() async {
    try {
      final paths = await _nativeAndroidPath.getAllPaths();
      setState(() {
        _result = 'All Paths:\n${paths.entries.map((e) => '${e.key}: ${e.value}').join('\n')}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting all paths: $e';
      });
    }
  }

  Future<void> _getInternalStoragePath() async {
    try {
      final path = await _nativeAndroidPath.getInternalStoragePath();
      setState(() {
        _result = 'Internal Storage Path: ${path ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting internal storage path: $e';
      });
    }
  }

  Future<void> _getExternalStoragePath() async {
    try {
      final path = await _nativeAndroidPath.getExternalStoragePath();
      setState(() {
        _result = 'External Storage Path: ${path ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting external storage path: $e';
      });
    }
  }

  Future<void> _getDownloadPath() async {
    try {
      final path = await _nativeAndroidPath.getDownloadPath();
      setState(() {
        _result = 'Download Path: ${path ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting download path: $e';
      });
    }
  }

  Future<void> _getPicturesPath() async {
    try {
      final path = await _nativeAndroidPath.getPicturesPath();
      setState(() {
        _result = 'Pictures Path: ${path ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting pictures path: $e';
      });
    }
  }

  Future<void> _isExternalStorageWritable() async {
    try {
      final isWritable = await _nativeAndroidPath.isExternalStorageWritable();
      setState(() {
        _result = 'External Storage Writable: $isWritable';
      });
    } catch (e) {
      setState(() {
        _result = 'Error checking writable status: $e';
      });
    }
  }

  Future<void> _getExternalStorageDirectories() async {
    try {
      final paths = await _nativeAndroidPath.getExternalStorageDirectories('Pictures');
      setState(() {
        _result = 'External Picture Directories:\n${paths.join('\n')}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting external directories: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Android Path Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _result,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getPlatformVersion,
              child: const Text('Get Platform Version'),
            ),
            ElevatedButton(
              onPressed: _getAllPaths,
              child: const Text('Get All Paths'),
            ),
            ElevatedButton(
              onPressed: _getInternalStoragePath,
              child: const Text('Get Internal Storage Path'),
            ),
            ElevatedButton(
              onPressed: _getExternalStoragePath,
              child: const Text('Get External Storage Path'),
            ),
            ElevatedButton(
              onPressed: _getDownloadPath,
              child: const Text('Get Download Path'),
            ),
            ElevatedButton(
              onPressed: _getPicturesPath,
              child: const Text('Get Pictures Path'),
            ),
            ElevatedButton(
              onPressed: _isExternalStorageWritable,
              child: const Text('Is External Storage Writable'),
            ),
            ElevatedButton(
              onPressed: _getExternalStorageDirectories,
              child: const Text('Get External Picture Directories'),
            ),
          ],
        ),
      ),
    );
  }
}