## 0.0.1

* initial release.

## 0.0.2

* Fix bug path directory.


## 0.0.3

* Update Sdk.
* By default, permissions are enabled, so there's no need to declare them in the AndroidManifest.xml file.

## 0.0.4

* Fix pub point.

## 0.0.5

* Added `getRootInstallationPath()` method to retrieve the root installation path where applications are installed (typically `/data`).
* Updated `getAllPaths()` to include the new root installation path.
* Enhanced Android native implementation to support root installation path retrieval.