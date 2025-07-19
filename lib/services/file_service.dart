import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';

final separator = Platform.pathSeparator;

class FileService {
  FileService();
  // Directory where files will be stored
  late final Directory cacheDir;
  late final Directory supportDir;
  late final Directory documentsDir;
  late final Directory temporaryDir;

  Future<void> init() async {
    cacheDir = await getApplicationCacheDirectory();
    supportDir = await getApplicationSupportDirectory();
    documentsDir = await getApplicationDocumentsDirectory();
    temporaryDir = await getTemporaryDirectory();
  }

  // getters
  String get cachePath => cacheDir.path;
  String get supportPath => supportDir.path;
  String get documentsPath => documentsDir.path;
  String get temporaryPath => temporaryDir.path;

  /// Method to create the directory if it doesn't exist
  Future<void> _ensureDirectoryExists() async {
    final directory = Directory(documentsPath);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  }

  String getFilePath(String directoryPath, String fileName) {
    return directoryPath + separator + fileName;
  }

  Future<bool> isFileExist(String directoryPath, String fileName) async {
    Directory directory = Directory(directoryPath);
    if (!await directory.exists()) return false;

    final path = '${directory.path}$separator$fileName';

    File file = File(path);
    return await file.exists();
  }

  /// Method to check if a file exists
  Future<bool> doesFileExist(String fileName) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    return await file.exists();
  }

  /// Method to save data to a file
  Future<void> saveFile(String fileName, String data) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    await file.writeAsString(data);
  }

  /// Method to write data to a file (overwrite existing content)
  Future<void> writeFile(String fileName, String data) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    await file.writeAsString(data);
  }

  /// Method to read data from a file
  Future<String> readFile(String fileName) async {
    await _ensureDirectoryExists();
    final file = File('$documentsPath$separator$fileName');
    if (await file.exists()) {
      return await file.readAsString();
    } else {
      throw FileSystemException('File not found: $fileName');
    }
  }

  /// Method to delete a file
  Future<void> deleteFile(String path) async {
    try {
      await _ensureDirectoryExists();
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      debugPrint('e: $e');
    }
  }

  // Future<void> deleteFile(String fileName) async {
  //   await _ensureDirectoryExists();
  //   final file = File('$_directoryPath/$fileName');
  //   if (await file.exists()) {
  //     await file.delete();
  //   }
  // }
}
