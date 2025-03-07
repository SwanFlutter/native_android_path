package com.example.native_android_path

import android.content.Context
import android.os.Build
import android.os.Environment
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File
import java.util.HashMap

/** NativeAndroidPathPlugin */
class NativeAndroidPathPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "native_android_path")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    try {
      when (call.method) {
        "getPlatformVersion" -> {
          result.success("Android ${Build.VERSION.RELEASE}")
        }
        "getAllPaths" -> {
          result.success(getAllStoragePaths())
        }
        "getExternalStoragePath" -> {
          val externalStoragePath = getExternalStoragePath()
          if (externalStoragePath != null) {
            result.success(externalStoragePath)
          } else {
            result.error("EXTERNAL_STORAGE_ERROR", "External storage is not available", null)
          }
        }
        "getInternalStoragePath" -> {
          result.success(getInternalStoragePath())
        }
        "getExternalCachePath" -> {
          val externalCachePath = getExternalCachePath()
          if (externalCachePath != null) {
            result.success(externalCachePath)
          } else {
            result.error("EXTERNAL_CACHE_ERROR", "External cache directory is not available", null)
          }
        }
        "getInternalCachePath" -> {
          result.success(getInternalCachePath())
        }
        "getDownloadPath" -> {
          val downloadPath = getDownloadPath()
          if (downloadPath != null) {
            result.success(downloadPath)
          } else {
            result.error("DOWNLOAD_PATH_ERROR", "Download directory is not available", null)
          }
        }
        "getExternalStorageDirectories" -> {
          val type = call.argument<String>("type")
          val paths = getExternalStorageDirectories(type)
          if (paths.isNotEmpty()) {
            result.success(paths)
          } else {
            result.error("EXTERNAL_DIRECTORIES_ERROR", "External directories are not available", null)
          }
        }
        "isExternalStorageWritable" -> {
          result.success(isExternalStorageWritable())
        }
        "isExternalStorageReadable" -> {
          result.success(isExternalStorageReadable())
        }
        else -> {
          result.notImplemented()
        }
      }
    } catch (e: Exception) {
      result.error("NATIVE_ERROR", "Error accessing storage paths: ${e.message}", e.stackTraceToString())
    }
  }

  private fun getAllStoragePaths(): Map<String, String?> {
    val paths = HashMap<String, String?>()

    try {
      paths["internalStorage"] = getInternalStoragePath()
    } catch (e: Exception) {
      paths["internalStorage"] = null
    }

    try {
      paths["externalStorage"] = getExternalStoragePath()
    } catch (e: Exception) {
      paths["externalStorage"] = null
    }

    try {
      paths["internalCache"] = getInternalCachePath()
    } catch (e: Exception) {
      paths["internalCache"] = null
    }

    try {
      paths["externalCache"] = getExternalCachePath()
    } catch (e: Exception) {
      paths["externalCache"] = null
    }

    try {
      paths["downloads"] = getDownloadPath()
    } catch (e: Exception) {
      paths["downloads"] = null
    }

    try {
      paths["dcim"] = getDCIMPath()
    } catch (e: Exception) {
      paths["dcim"] = null
    }

    try {
      paths["pictures"] = getPicturesPath()
    } catch (e: Exception) {
      paths["pictures"] = null
    }

    try {
      paths["movies"] = getMoviesPath()
    } catch (e: Exception) {
      paths["movies"] = null
    }

    try {
      paths["music"] = getMusicPath()
    } catch (e: Exception) {
      paths["music"] = null
    }

    try {
      paths["ringtones"] = getRingtonesPath()
    } catch (e: Exception) {
      paths["ringtones"] = null
    }

    try {
      paths["alarms"] = getAlarmsPath()
    } catch (e: Exception) {
      paths["alarms"] = null
    }

    try {
      paths["notifications"] = getNotificationsPath()
    } catch (e: Exception) {
      paths["notifications"] = null
    }

    try {
      paths["documents"] = getDocumentsPath()
    } catch (e: Exception) {
      paths["documents"] = null
    }

    try {
      paths["podcasts"] = getPodcastsPath()
    } catch (e: Exception) {
      paths["podcasts"] = null
    }

    try {
      paths["screenshots"] = getScreenshotsPath()
    } catch (e: Exception) {
      paths["screenshots"] = null
    }

    try {
      paths["audiobooks"] = getAudiobooksPath()
    } catch (e: Exception) {
      paths["audiobooks"] = null
    }

    return paths
  }

  private fun getInternalStoragePath(): String {
    return context.filesDir.absolutePath
  }

  private fun getExternalStoragePath(): String? {
    return if (isExternalStorageWritable() || isExternalStorageReadable()) {
      context.getExternalFilesDir(null)?.absolutePath
    } else {
      null
    }
  }

  private fun getInternalCachePath(): String {
    return context.cacheDir.absolutePath
  }

  private fun getExternalCachePath(): String? {
    return context.externalCacheDir?.absolutePath
  }

  private fun getDownloadPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)?.absolutePath
  }

  private fun getDCIMPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_DCIM)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM)?.absolutePath
  }

  private fun getPicturesPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_PICTURES)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)?.absolutePath
  }

  private fun getMoviesPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_MOVIES)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES)?.absolutePath
  }

  private fun getMusicPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_MUSIC)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC)?.absolutePath
  }

  private fun getRingtonesPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_RINGTONES)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_RINGTONES)?.absolutePath
  }

  private fun getAlarmsPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_ALARMS)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_ALARMS)?.absolutePath
  }

  private fun getNotificationsPath(): String? {
    return context.getExternalFilesDir(Environment.DIRECTORY_NOTIFICATIONS)?.absolutePath
      ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_NOTIFICATIONS)?.absolutePath
  }

  private fun getDocumentsPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
      context.getExternalFilesDir(Environment.DIRECTORY_DOCUMENTS)?.absolutePath
        ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS)?.absolutePath
    } else {
      // For older versions, create a documents directory in external storage
      val documents = File(Environment.getExternalStorageDirectory(), "Documents")
      if (!documents.exists()) {
        documents.mkdirs()
      }
      documents.absolutePath
    }
  }

  private fun getExternalStorageDirectories(type: String?): List<String> {
    val directoryType = when (type) {
      "downloads" -> Environment.DIRECTORY_DOWNLOADS
      "pictures" -> Environment.DIRECTORY_PICTURES
      "dcim" -> Environment.DIRECTORY_DCIM
      "movies" -> Environment.DIRECTORY_MOVIES
      "music" -> Environment.DIRECTORY_MUSIC
      "documents" -> Environment.DIRECTORY_DOCUMENTS
      else -> null
    }

    val paths = mutableListOf<String>()

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
      val externalDirs = context.getExternalFilesDirs(directoryType)
      for (dir in externalDirs) {
        if (dir != null) {
          paths.add(dir.absolutePath)
        }
      }
    } else {
      // Fallback for older Android versions
      context.getExternalFilesDir(directoryType)?.let {
        paths.add(it.absolutePath)
      }
    }

    return paths
  }


  private fun getPodcastsPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) { // Android 10 یا بالاتر
      context.getExternalFilesDir(Environment.DIRECTORY_PODCASTS)?.absolutePath
        ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PODCASTS)?.absolutePath
    } else {
      // برای نسخه‌های قدیمی‌تر، یک دایرکتوری Podcasts در حافظه خارجی ایجاد می‌کنیم
      val podcasts = File(Environment.getExternalStorageDirectory(), "Podcasts")
      if (!podcasts.exists()) {
        podcasts.mkdirs()
      }
      podcasts.absolutePath
    }
  }

  private fun getScreenshotsPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) { // Android 10 یا بالاتر
      context.getExternalFilesDir(Environment.DIRECTORY_SCREENSHOTS)?.absolutePath
        ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_SCREENSHOTS)?.absolutePath
    } else {
      // برای نسخه‌های قدیمی‌تر، یک دایرکتوری Screenshots در پوشه Pictures ایجاد می‌کنیم
      val screenshots = File(Environment.getExternalStorageDirectory(), "Pictures/Screenshots")
      if (!screenshots.exists()) {
        screenshots.mkdirs()
      }
      screenshots.absolutePath
    }
  }


  private fun getAudiobooksPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) { // Android 10 یا بالاتر
      context.getExternalFilesDir(Environment.DIRECTORY_AUDIOBOOKS)?.absolutePath
        ?: Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_AUDIOBOOKS)?.absolutePath
    } else {
      val audiobooks = File(Environment.getExternalStorageDirectory(), "Audiobooks")
      if (!audiobooks.exists()) {
        audiobooks.mkdirs()
      }
      audiobooks.absolutePath
    }
  }

  private fun isExternalStorageWritable(): Boolean {
    return Environment.getExternalStorageState() == Environment.MEDIA_MOUNTED
  }

  private fun isExternalStorageReadable(): Boolean {
    val state = Environment.getExternalStorageState()
    return state == Environment.MEDIA_MOUNTED || state == Environment.MEDIA_MOUNTED_READ_ONLY
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}