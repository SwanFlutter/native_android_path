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
import android.util.Log

class NativeAndroidPathPlugin : FlutterPlugin, MethodCallHandler {
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
        "getPlatformVersion" -> result.success("Android ${Build.VERSION.RELEASE}")
        "getAllPaths" -> result.success(getAllStoragePaths())
        "getInternalStoragePath" -> result.success(getInternalStoragePath())
        "getExternalStoragePath" -> {
          val path = getExternalStoragePath()
          if (path != null) result.success(path) else result.error("EXTERNAL_STORAGE_ERROR", "External storage not available", null)
        }
        "getInternalCachePath" -> result.success(getInternalCachePath())
        "getExternalCachePath" -> {
          val path = getExternalCachePath()
          if (path != null) result.success(path) else result.error("EXTERNAL_CACHE_ERROR", "External cache directory not available", null)
        }
        "getDownloadPath" -> {
          val path = getDownloadPath()
          Log.d("NativeAndroidPath", "Download Path: $path")
          if (path != null) result.success(path) else result.error("DOWNLOAD_PATH_ERROR", "Download directory not available", null)
        }
        "getDCIMPath" -> {
          val path = getDCIMPath()
          if (path != null) result.success(path) else result.error("DCIM_PATH_ERROR", "DCIM directory not available", null)
        }
        "getPicturesPath" -> {
          val path = getPicturesPath()
          if (path != null) result.success(path) else result.error("PICTURES_PATH_ERROR", "Pictures directory not available", null)
        }
        "getMoviesPath" -> {
          val path = getMoviesPath()
          if (path != null) result.success(path) else result.error("MOVIES_PATH_ERROR", "Movies directory not available", null)
        }
        "getMusicPath" -> {
          val path = getMusicPath()
          if (path != null) result.success(path) else result.error("MUSIC_PATH_ERROR", "Music directory not available", null)
        }
        "getRingtonesPath" -> {
          val path = getRingtonesPath()
          if (path != null) result.success(path) else result.error("RINGTONES_PATH_ERROR", "Ringtones directory not available", null)
        }
        "getAlarmsPath" -> {
          val path = getAlarmsPath()
          if (path != null) result.success(path) else result.error("ALARMS_PATH_ERROR", "Alarms directory not available", null)
        }
        "getNotificationsPath" -> {
          val path = getNotificationsPath()
          if (path != null) result.success(path) else result.error("NOTIFICATIONS_PATH_ERROR", "Notifications directory not available", null)
        }
        "getDocumentsPath" -> {
          val path = getDocumentsPath()
          if (path != null) result.success(path) else result.error("DOCUMENTS_PATH_ERROR", "Documents directory not available", null)
        }
        "getPodcastsPath" -> {
          val path = getPodcastsPath()
          if (path != null) result.success(path) else result.error("PODCASTS_PATH_ERROR", "Podcasts directory not available", null)
        }
        "getScreenshotsPath" -> {
          val path = getScreenshotsPath()
          if (path != null) result.success(path) else result.error("SCREENSHOTS_PATH_ERROR", "Screenshots directory not available", null)
        }
        "getAudiobooksPath" -> {
          val path = getAudiobooksPath()
          if (path != null) result.success(path) else result.error("AUDIOBOOKS_PATH_ERROR", "Audiobooks directory not available", null)
        }
        "isExternalStorageWritable" -> result.success(isExternalStorageWritable())
        "isExternalStorageReadable" -> result.success(isExternalStorageReadable())
        "getExternalStorageDirectories" -> {
          val type = call.argument<String>("type")?.lowercase()
          val paths = getExternalStorageDirectories(type)
          if (paths.isNotEmpty()) {
            result.success(paths)
          } else {
            // Changed to return empty list instead of error to avoid crashes
            result.success(emptyList<String>())
          }
        }
        "getRootInstallationPath" -> {
          val path = getRootInstallationPath()
          if (path != null) result.success(path) else result.error("ROOT_INSTALL_PATH_ERROR", "Root installation path not available", null)
        }
        else -> result.notImplemented()
      }
    } catch (e: Exception) {
      Log.e("NativeAndroidPath", "Error in method ${call.method}: ${e.message}", e)
      result.error("NATIVE_ERROR", "Error accessing storage paths: ${e.message}", e.stackTraceToString())
    }
  }

  private fun getAllStoragePaths(): Map<String, Any> {
    val paths = HashMap<String, Any>()

    // Changed to return empty string instead of null to avoid issues in Flutter
    try { paths["internalStorage"] = getInternalStoragePath() } catch (e: Exception) { paths["internalStorage"] = "" }
    try { paths["externalStorage"] = getExternalStoragePath() ?: "" } catch (e: Exception) { paths["externalStorage"] = "" }
    try { paths["internalCache"] = getInternalCachePath() } catch (e: Exception) { paths["internalCache"] = "" }
    try { paths["externalCache"] = getExternalCachePath() ?: "" } catch (e: Exception) { paths["externalCache"] = "" }
    try { paths["downloads"] = getDownloadPath() ?: "" } catch (e: Exception) { paths["downloads"] = "" }
    try { paths["dcim"] = getDCIMPath() ?: "" } catch (e: Exception) { paths["dcim"] = "" }
    try { paths["pictures"] = getPicturesPath() ?: "" } catch (e: Exception) { paths["pictures"] = "" }
    try { paths["movies"] = getMoviesPath() ?: "" } catch (e: Exception) { paths["movies"] = "" }
    try { paths["music"] = getMusicPath() ?: "" } catch (e: Exception) { paths["music"] = "" }
    try { paths["ringtones"] = getRingtonesPath() ?: "" } catch (e: Exception) { paths["ringtones"] = "" }
    try { paths["alarms"] = getAlarmsPath() ?: "" } catch (e: Exception) { paths["alarms"] = "" }
    try { paths["notifications"] = getNotificationsPath() ?: "" } catch (e: Exception) { paths["notifications"] = "" }
    try { paths["documents"] = getDocumentsPath() ?: "" } catch (e: Exception) { paths["documents"] = "" }
    try { paths["podcasts"] = getPodcastsPath() ?: "" } catch (e: Exception) { paths["podcasts"] = "" }
    try { paths["screenshots"] = getScreenshotsPath() ?: "" } catch (e: Exception) { paths["screenshots"] = "" }
    try { paths["audiobooks"] = getAudiobooksPath() ?: "" } catch (e: Exception) { paths["audiobooks"] = "" }
    try { paths["rootInstallation"] = getRootInstallationPath() ?: "" } catch (e: Exception) { paths["rootInstallation"] = "" }

    return paths
  }

  private fun getInternalStoragePath(): String {
    return context.filesDir.absolutePath
  }

  private fun getExternalStoragePath(): String? {
    return if (isExternalStorageReadable()) {
      Environment.getExternalStorageDirectory()?.absolutePath
    } else null
  }

  private fun getInternalCachePath(): String {
    return context.cacheDir.absolutePath
  }

  private fun getExternalCachePath(): String? {
    // For app-specific external cache directory:
    return context.externalCacheDir?.absolutePath

    // If you still want the public cache directory:
    // return Environment.getExternalStorageDirectory()?.let {
    //   File(it, "Cache").apply { if (!exists()) mkdirs() }.absolutePath
    // }
  }

  private fun getDownloadPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)?.absolutePath
  }

  private fun getDCIMPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM)?.absolutePath
  }

  private fun getPicturesPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)?.absolutePath
  }

  private fun getMoviesPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES)?.absolutePath
  }

  private fun getMusicPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC)?.absolutePath
  }

  private fun getRingtonesPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_RINGTONES)?.absolutePath
  }

  private fun getAlarmsPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_ALARMS)?.absolutePath
  }

  private fun getNotificationsPath(): String? {
    return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_NOTIFICATIONS)?.absolutePath
  }

  private fun getDocumentsPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
      Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS)?.absolutePath
    } else {
      File(Environment.getExternalStorageDirectory(), "Documents").apply {
        if (!exists()) mkdirs()
      }.absolutePath
    }
  }

  private fun getPodcastsPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PODCASTS)?.absolutePath
    } else {
      File(Environment.getExternalStorageDirectory(), "Podcasts").apply {
        if (!exists()) mkdirs()
      }.absolutePath
    }
  }

  private fun getScreenshotsPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_SCREENSHOTS)?.absolutePath
    } else {
      File(Environment.getExternalStorageDirectory(), "Pictures/Screenshots").apply {
        if (!exists()) mkdirs()
      }.absolutePath
    }
  }

  private fun getAudiobooksPath(): String? {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_AUDIOBOOKS)?.absolutePath
    } else {
      File(Environment.getExternalStorageDirectory(), "Audiobooks").apply {
        if (!exists()) mkdirs()
      }.absolutePath
    }
  }

  private fun getExternalStorageDirectories(type: String?): List<String> {
    val paths = mutableListOf<String>()

    // Android 10+ (API 29+) needs special handling for external storage
    val directoryType = when (type?.lowercase()) {
      "downloads" -> Environment.DIRECTORY_DOWNLOADS
      "pictures" -> Environment.DIRECTORY_PICTURES
      "dcim" -> Environment.DIRECTORY_DCIM
      "movies" -> Environment.DIRECTORY_MOVIES
      "music" -> Environment.DIRECTORY_MUSIC
      "documents" -> Environment.DIRECTORY_DOCUMENTS
      "podcasts" -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) Environment.DIRECTORY_PODCASTS else null
      "screenshots" -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) Environment.DIRECTORY_SCREENSHOTS else null
      "audiobooks" -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) Environment.DIRECTORY_AUDIOBOOKS else null
      else -> null
    }

    if (directoryType != null) {
      // For the primary external storage
      Environment.getExternalStoragePublicDirectory(directoryType)?.let {
        paths.add(it.absolutePath)
      }

      // For additional storage volumes on devices with multiple external storage options
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
        context.getExternalFilesDirs(directoryType)?.forEach { file ->
          file?.let {
            // Remove the app-specific part of the path to get the root of the external storage
            val path = it.absolutePath
            val pathSegments = path.split("/Android/")
            if (pathSegments.isNotEmpty()) {
              paths.add(pathSegments[0])
            }
          }
        }
      }
    }

    return paths.distinct()  // Remove duplicates
  }

  private fun getRootInstallationPath(): String? {
    return try {
      // Return the root filesystem path where system apps are installed
      // This is typically "/system" but we return "/" as the root
      // Apps are typically installed in /system/app, /system/priv-app, /data/app, etc.
      // For user-installed apps, they are in /data/app
      // For system apps, they are in /system/app or /system/priv-app
      
      // We'll return the data partition root where user apps are installed
      val dataDir = context.applicationInfo.dataDir
      if (dataDir != null) {
        // Extract the root path from the data directory
        // Typically /data/data/package.name -> we want /data
        val pathSegments = dataDir.split("/")
        if (pathSegments.size >= 3) {
          return "/${pathSegments[1]}" // This will be "/data"
        }
      }
      
      // Fallback: return the system root
      "/"
    } catch (e: Exception) {
      Log.e("NativeAndroidPath", "Error getting root installation path: ${e.message}", e)
      null
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