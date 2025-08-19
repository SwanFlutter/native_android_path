import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_android_path/native_android_path.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.blue,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
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
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
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

  Widget _buildResultCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SelectableText(_result, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

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
        _result =
            'All Paths:\n${paths.entries.map((e) => '${e.key}: ${e.value}').join('\n')}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting all paths: $e';
      });
    }
    debugPrint(_result);
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
    debugPrint(_result);
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
    debugPrint(_result);
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
    debugPrint(_result);
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
    debugPrint(_result);
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
    debugPrint(_result);
  }

  Future<void> _getExternalStorageDirectories() async {
    try {
      final paths = await _nativeAndroidPath.getExternalStorageDirectories(
        'Pictures',
      );
      setState(() {
        _result = 'External Picture Directories:\n${paths.join('\n')}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting external directories: $e';
      });
    }
    debugPrint(_result);
  }

  Future<void> _getPodcastsPath() async {
    try {
      final path = await _nativeAndroidPath.getPodcastsPath();
      setState(() {
        _result = 'Podcasts Path: ${path ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting podcasts path: $e';
      });
    }
    debugPrint(_result);
  }

  Future<void> _getScreenshotsPath() async {
    try {
      final path = await _nativeAndroidPath.getScreenshotsPath();
      setState(() {
        _result = 'Screenshots Path: ${path ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting screenshots path: $e';
      });
    }
    debugPrint(_result);
  }

  Future<void> _getAudiobooksPath() async {
    try {
      final path = await _nativeAndroidPath.getAudiobooksPath();
      setState(() {
        _result = 'Audiobooks Path: ${path ?? 'Unknown'}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error getting audiobooks path: $e';
      });
    }
    debugPrint(_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native Android Path Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            _buildResultCard(),
            const SizedBox(height: 20),

            _buildActionButton('Get Platform Version', _getPlatformVersion),

            _buildActionButton('Get All Paths', _getAllPaths),

            _buildActionButton(
              'Get Internal Storage Path',
              _getInternalStoragePath,
            ),

            _buildActionButton(
              'Get External Storage Path',
              _getExternalStoragePath,
            ),

            _buildActionButton('Get Download Path', _getDownloadPath),

            _buildActionButton('Get Pictures Path', _getPicturesPath),

            _buildActionButton('Get Podcasts Path', _getPodcastsPath),

            _buildActionButton('Get Screenshots Path', _getScreenshotsPath),

            _buildActionButton('Get Audiobooks Path', _getAudiobooksPath),

            _buildActionButton(
              'Is External Storage Writable',
              _isExternalStorageWritable,
            ),

            _buildActionButton(
              'Get External Picture Directories',
              _getExternalStorageDirectories,
            ),
          ],
        ),
      ),
    );
  }
}
