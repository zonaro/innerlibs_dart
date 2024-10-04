import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

extension DirectoryExtensionPlus on Directory {
  /// A getter that returns the count of all elements in the list synchronously.
  ///
  /// This getter accesses the `listAllSync` property and returns its length.
  ///
  /// Returns:
  ///   An integer representing the number of elements in the list.
  int get countSync => listAllSync.length;

  /// Asynchronously gets the count of items in the list.
  ///
  /// This getter returns the length of the list obtained from the `listAll`
  /// method, which is awaited to ensure the list is fully retrieved before
  /// calculating its length.
  ///
  /// Returns a [Future<int>] that completes with the number of items in the list.
  Future<int> get count async => (await listAll).length;

  /// Returns a [Future] that completes with an [Iterable] of [FileSystemEntity]
  /// objects representing the contents of the directory. The listing is not
  /// recursive.
  ///
  /// Example:
  /// ```dart
  /// var files = await directory.listAll;
  /// ```
  ///
  /// Returns:
  /// - A [Future] that completes with an [Iterable] of [FileSystemEntity] objects.
  Future<Iterable<FileSystemEntity>> get listAll async => await list(recursive: false).toList();

  /// Asynchronously lists all files and directories recursively.
  ///
  /// This getter returns a [Future] that completes with an [Iterable] of
  /// [FileSystemEntity] objects representing all files and directories
  /// within the current directory and its subdirectories.
  ///
  /// Example usage:
  /// ```dart
  /// var files = await directory.listAllRecursive;
  /// files.forEach((file) {
  ///   print(file.path);
  /// });
  /// ```
  ///
  /// Returns a [Future] that completes with an [Iterable] of
  /// [FileSystemEntity] objects.
  Future<Iterable<FileSystemEntity>> get listAllRecursive async => await list(recursive: true).toList();

  /// Returns a list of all file system entities in the current directory.
  ///
  /// This method lists all files and directories in the current directory
  /// without recursing into subdirectories.
  ///
  /// Returns:
  ///   A list of [FileSystemEntity] objects representing the files and
  ///   directories in the current directory.

  List<FileSystemEntity> get listAllSync => listSync(recursive: false);

  /// Returns a list of all file system entities within the current directory and
  /// its subdirectories, recursively. This method performs a synchronous
  /// operation to retrieve the list of entities.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var entities = directory.listAllRecursiveSync;
  /// for (var entity in entities) {
  ///   print(entity.path);
  /// }
  /// ```
  ///
  /// Returns:
  ///   A list of [FileSystemEntity] objects representing the files and
  ///   directories found within the current directory and its subdirectories.
  List<FileSystemEntity> get listAllRecursiveSync => listSync(recursive: true);

  /// Asynchronously lists all directories within the current directory.
  ///
  /// This getter returns a [Future] that completes with an [Iterable] of
  /// [Directory] objects, representing all the directories found.
  ///
  /// Example usage:
  /// ```dart
  /// var directories = await instance.listDirectories;
  /// for (var directory in directories) {
  ///   print(directory.path);
  /// }
  /// ```
  Future<Iterable<Directory>> get listDirectories async => (await listAll).whereType<Directory>();

  /// Asynchronously retrieves a list of directories recursively.
  ///
  /// This getter returns a [Future] that completes with an [Iterable] of
  /// [Directory] objects. It performs a recursive search and filters the
  /// results to include only directories.
  ///
  /// Example usage:
  /// ```dart
  /// var directories = await instance.listDirectoriesRecursive;
  /// ```
  ///
  /// Returns a [Future] that completes with an [Iterable] of [Directory] objects.
  Future<Iterable<Directory>> get listDirectoriesRecursive async => (await listAllRecursive).whereType<Directory>();

  /// Returns an iterable of directories from the list of all file system entities.
  ///
  /// This getter filters the list of all file system entities and returns only
  /// those that are of type [Directory].
  ///
  /// Example usage:
  /// ```dart
  /// Iterable<Directory> directories = someObject.listDirectoriesSync;
  /// ```
  Iterable<Directory> get listDirectoriesSync => listAllSync.whereType<Directory>();

  /// An extension property that recursively lists all directories in the current directory.
  ///
  /// This property returns an [Iterable] of [Directory] objects, which are filtered from
  /// the result of `listAllRecursiveSync`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var directories = someDirectory.listDirectoriesRecursiveSync;
  /// for (var dir in directories) {
  ///   print(dir.path);
  /// }
  /// ```
  ///
  /// Note: Ensure that `listAllRecursiveSync` is defined and returns an [Iterable] of file system entities.
  Iterable<Directory> get listDirectoriesRecursiveSync => listAllRecursiveSync.whereType<Directory>();

  /// Asynchronously retrieves a list of all files in the current directory.
  ///
  /// This getter returns a `Future` that completes with an `Iterable` of `File`
  /// objects, filtering out any non-file entities.
  ///
  /// Example usage:
  /// ```dart
  /// final files = await instance.listFiles;
  /// for (var file in files) {
  ///   print(file.path);
  /// }
  /// ```
  Future<Iterable<File>> get listFiles async => (await listAll).whereType<File>();

  /// Asynchronously retrieves a list of all files recursively from the current directory.
  ///
  /// This getter returns a `Future` that completes with an `Iterable` of `File` objects
  /// found within the directory and its subdirectories.
  ///
  /// Example usage:
  /// ```dart
  /// final files = await directory.listFilesRecursive;
  /// for (var file in files) {
  ///   print(file.path);
  /// }
  /// ```
  ///
  /// Returns:
  /// - A `Future` that completes with an `Iterable` of `File` objects.
  Future<Iterable<File>> get listFilesRecursive async => (await listAllRecursive).whereType<File>();

  /// Returns an iterable of files from the list of all entities in the directory.
  ///
  /// This getter filters the list of all entities and returns only those that
  /// are of type [File].
  ///
  /// Example:
  /// ```dart
  /// Iterable<File> files = directory.listFilesSync;
  /// ```
  Iterable<File> get listFilesSync => listAllSync.whereType<File>();

  /// Returns an iterable of all files found recursively within the directory.
  ///
  /// This getter filters the results of `listAllRecursiveSync` to include only
  /// instances of `File`.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final files = directory.listFilesRecursiveSync;
  /// for (final file in files) {
  ///   print(file.path);
  /// }
  /// ```
  Iterable<File> get listFilesRecursiveSync => listAllRecursiveSync.whereType<File>();
}

extension FileExtensionPlus on File {
  /// Convert File to base64 sync
  String? get base64 {
    List<int> fileBytes = readAsBytesSync();
    return base64Encode(fileBytes);
  }

  String get dataURI => "data:$mimeType;base64,$base64";

  /// Get File extension
  String get fileExtension => path.extension(this.path);

  /// Get File extension without dot
  string get fileExtensionWithoutDot => path.extension(this.path).removeFirstEqual(".");

  /// Get File name without extension
  String get fileNameWithoutExtension => path.basenameWithoutExtension(this.path);

  /// Get the MD5 checksum of the file
  Future<String> get md5Checksum async {
    var st = openRead();
    final checksum = (await md5.bind(st).first).toString();
    return checksum;
  }

  string get mimeType => lookupMimeType(name) ?? "application/octet-stream";
}

extension FileSystemEntityExtensionPlus on FileSystemEntity {
  String? get directoryName {
    if (this is File) {
      return path.dirname(this.path);
    }
    if (this is Directory) {
      return this.path;
    }
    return path.basename(this.path);
  }

  /// Get the ID of the file or directory
  int get id => this.path.hashCode;

  /// Get the index of the file or directory in the parent directory
  int get index => parent.listFilesSync.map((x) => x.id).toList().indexOf(id);

  /// Get File or directory name
  String get name => path.basename(this.path);

  /// Get File or directory name without extension
  String get nameWithoutExtension => path.basenameWithoutExtension(this.path);

  /// Get the parent directory of the file or directory
  string get relativePath => relativePathFrom(null);

  /// Get the size of the file or directory
  string get shortSize => size.formatFileSize;

  date get lastModified {
    if (this is File) {
      return (this as File).lastModifiedSync();
    }
    if (this is Directory) {
      return (this as Directory).listFilesRecursiveSync.map((e) => e.lastModifiedSync()).maxOrNull ?? minDate;
    }
    return minDate;
  }

  date get lastAccessed {
    if (this is File) {
      return (this as File).lastAccessedSync();
    }
    if (this is Directory) {
      return (this as Directory).listFilesRecursiveSync.map((e) => e.lastAccessedSync()).maxOrNull ?? minDate;
    }
    return minDate;
  }

  /// Get the size of the file or directory
  int get size {
    if (this is File) {
      return (this as File).lengthSync();
    }
    if (this is Directory) {
      return (this as Directory).listSync(recursive: true).fold<int>(0, (prev, element) {
        prev += element.size;
        return prev;
      });
    }

    return 0;
  }

  /// Get the title of the file or directory
  /// The title is the name of the file or directory without the extension. If the name is camelCase or snake_case, it will be converted into Title Case
  string get title => nameWithoutExtension.friendlyName;

  /// Get the type description of the file or directory
  string get typeDescription {
    if (this is File) {
      return "File";
    }
    if (this is Directory) {
      return "Directory";
    }
    return "Unknown";
  }

  /// Get relative path from root path
  string relativePathFrom(string? rootPath) => path.relative(this.path, from: rootPath);

  /// Return the details of a File or Directory as a Json
  Future<JsonMap> toJson({string rootUrlPath = ""}) async {
    return {
      "index": index,
      "title": title,
      "name": name,
      "fullName": this.path,
      if (rootUrlPath.isNotBlank) "url": url(rootUrlPath).toString(),
      "size": size,
      "shortSize": shortSize,
      "typeDescription": typeDescription,
      if (this is File) "Mime": (this as File).mimeType,
      "relativePath": relativePath,
      if (this is File) "MD5CheckSum": await (this as File).md5Checksum,
      if (this is Directory) "count": (this as Directory).count,
      if (this is Directory) "Children": [for (var e in (this as Directory).listSync()) await e.toJson(rootUrlPath: rootUrlPath + e.relativePathFrom(e.parent.path))],
    };
  }

  Uri url(string rootUrlPath) {
    rootUrlPath = rootUrlPath.ifBlank("/");
    string s = path.join(rootUrlPath, relativePath.removeFirstEqual(rootUrlPath)).fixSlash(false);
    return Uri.parse(s);
  }
}
