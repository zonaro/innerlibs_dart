import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

extension DirectoryExtensionPlus on Directory {
  /// Asynchronously gets the count of items in the list.
  ///
  /// This getter returns the length of the list obtained from the `listAll`
  /// method, which is awaited to ensure the list is fully retrieved before
  /// calculating its length.
  ///
  /// Returns a [Future<int>] that completes with the number of items in the list.
  Future<int> get count async => (await listAll).length;

  /// A getter that returns the count of all elements in the list synchronously.
  ///
  /// This getter accesses the `listAllSync` property and returns its length.
  ///
  /// Returns:
  ///   An integer representing the number of elements in the list.
  int get countSync => listAllSync.length;

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
  List<FileSystemEntity> get listAllRecursiveSync {
    if (!existsSync()) return <FileSystemEntity>[];
    return listSync(recursive: true);
  }

  /// Returns a list of all file system entities in the current directory.
  ///
  /// This method lists all files and directories in the current directory
  /// without recursing into subdirectories.
  ///
  /// Returns:
  ///   A list of [FileSystemEntity] objects representing the files and
  ///   directories in the current directory.

  List<FileSystemEntity> get listAllSync {
    if (!existsSync()) return <FileSystemEntity>[];
    return listSync(recursive: false);
  }

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
  Future<Iterable<Directory>> get listDirectories async {
    if (await exists()) return <Directory>[];
    return (await listAll).whereType<Directory>();
  }

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
  Future<Iterable<Directory>> get listDirectoriesRecursive async {
    if (await exists()) return <Directory>[];
    return (await listAllRecursive).whereType<Directory>();
  }

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

  Future<Directory> copy(Directory to, [bool skipTopDirectory = false]) async {
    if (skipTopDirectory == false) {
      to = Directory(path.join(to.path, name).fixPath);
    }
    await to.create(recursive: true);
    for (var f in await listAll) {
      if (f is File) {
        var p = path.join(to.path, f.name).fixPath;
        f.copy(p);
      } else if (f is Directory) {
        await f.copy(Directory(path.join(to.path)), false);
      }
    }
    return to;
  }

  Future<Iterable<T>> search<T extends FileSystemEntity>({required dynamic searchTerms, required Iterable<dynamic> Function(T)? searchOn, int levenshteinDistance = 0, bool ignoreCase = true, bool ignoreDiacritics = true, bool ignoreWordSplitters = true, bool splitCamelCase = true, bool useWildcards = false, bool allIfEmpty = true, bool recursive = true}) async {
    searchOn ??= (x) => [x.name, x.path, x.title, x.directoryName, x.lastModified, x.lastAccessed];
    return (recursive ? (await listAllRecursive) : (await listAll)).whereType<T>().search(
          searchTerms: searchTerms,
          searchOn: searchOn,
          levenshteinDistance: levenshteinDistance,
          ignoreCase: ignoreCase,
          ignoreDiacritics: ignoreDiacritics,
          ignoreWordSplitters: ignoreWordSplitters,
          splitCamelCase: splitCamelCase,
          useWildcards: useWildcards,
          allIfEmpty: allIfEmpty,
        );
  }
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

  string get mimeType => lookupMimeType(this.path) ?? "application/octet-stream";

  string get mimeTypeSubType => mimeType.after("/");
  string get mimeTypeType => mimeType.before("/");
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

  /// Get the best icon for the file or directory
  IconData get icon {
    if (this is Directory) {
      return FontAwesome.folder;
    } else if (this is File) {
      var f = this as File;
      if (f.mimeTypeType == "image") {
        return FontAwesome.file_image;
      } else if (f.mimeTypeType == "video") {
        return FontAwesome.file_video;
      } else if (f.mimeTypeType == "audio") {
        return FontAwesome.file_audio;
      } else if (f.mimeTypeType == "text") {
        return FontAwesome.file_code;
      } else {
        switch (f.fileExtensionWithoutDot.toLowerCase()) {
          case 'jpg':
          case 'jpeg':
          case 'png':
          case 'gif':
          case 'bmp':
          case 'webp':
          case 'svg':
          case 'tiff':
          case 'ico':
            return FontAwesome.file_image;
          case 'pdf':
            return FontAwesome.file_pdf;
          case 'doc':
          case 'docx':
            return FontAwesome.file_word;
          case 'xls':
          case 'xlsx':
          case 'csv':
            return FontAwesome.file_excel;
          case 'ppt':
          case 'pptx':
          case 'pps':
            return FontAwesome.file_powerpoint;
          case 'txt':
          case 'md':
            return FontAwesome.file_lines;
          case 'html':
          case 'htm':
          case 'css':
          case 'js':
          case 'dart':
          case 'json':
          case 'xml':
          case 'yaml':
          case 'yml':
          case 'cs':
          case 'java':
          case 'php':
          case 'py':
            return FontAwesome.file_code;
          case 'sql':
            return FontAwesome.database_solid;
          case 'zip':
          case 'rar':
          case 'rar5':
          case '7z':
          case 'tar':
          case 'gz':
          case 'bz2':
          case 'xz':
          case 'zst':
            return FontAwesome.file_zipper;
          case 'mp3':
          case 'wav':
          case 'flac':
          case 'ogg':
          case 'm4a':
          case 'wma':
          case 'aac':
          case 'opus':
            return FontAwesome.file_audio;
          case 'mp4':
          case 'mkv':
          case 'webm':
          case 'flv':
          case 'mov':
          case 'wmv':
          case '3gp':
          case '3g2':
          case 'm4v':
          case 'avi':
            return FontAwesome.file_video;
          case 'apk':
          case 'appbundle':
            return FontAwesome.android_brand;
          case 'exe':
          case 'msi':
            return FontAwesome.window_maximize;
          default:
            return FontAwesome.file;
        }
      }
    }
    return FontAwesome.file;
  }

  /// Get the ID of the file or directory
  int get id => this.path.hashCode;

  /// Get the index of the file or directory in the parent directory
  int get index => parent.listFilesSync.map((x) => x.id).toList().indexOf(id);

  bool get isAudio {
    if (this is File) {
      var f = this as File;
      return f.mimeTypeType == "audio" || f.fileExtensionWithoutDot.flatContainsAny(["mp3", "wav", "flac", "ogg", "m4a", "wma", "aac", "opus"]);
    }
    return false;
  }

  bool get isDocument {
    if (this is File) {
      var f = this as File;
      return f.fileExtensionWithoutDot.flatContainsAny(["pdf", "doc", "docx", "xls", "xlsx", "csv", "ppt", "pptx", "pps", "txt", "md", "html", "htm"]);
    }
    return false;
  }

  bool get isEmpty {
    if (this is Directory) {
      return (this as Directory).listSync().isEmpty;
    } else if (this is File) {
      return (this as File).lengthSync() == 0;
    }
    return size == 0;
  }

  bool get isHidden => name.startsWith('.');

  bool get isImage {
    if (this is File) {
      var f = this as File;
      return f.mimeTypeType == "image" || f.fileExtensionWithoutDot.flatContainsAny(["jpg", "jpeg", "png", "gif", "bmp", "webp", "svg", "tiff", "ico"]);
    }
    return false;
  }

  bool get isSourceCode {
    if (this is File) {
      var f = this as File;
      return f.fileExtensionWithoutDot.flatContainsAny([
        "dart",
        "html",
        "css",
        "js",
        "json",
        "xml",
        "yaml",
        "yml",
        "cs",
        "java",
        "php",
        "py",
        "sql",
        "sh",
        "bat",
        "cmd",
        "ps1",
        "psm1",
        "psd1",
        "ps1xml",
        "psc1",
        "psm1",
        "psrc",
        "pssc",
        "cdxml",
        "xaml",
        "lua",
        "pl",
        "pm",
        "t",
        "r",
        "rb",
        "rake",
        "gemspec",
        "pp",
        "podspec",
        "scala",
        "scm",
        "ss",
        "st",
        "swift",
        "vb",
        "vbs",
        "vbe",
        "wsf",
        "wsc",
        "wsh",
        "c",
        "h",
        "cpp",
        "hpp",
        "cc",
        "hh",
        "cxx",
        "hxx",
        "c++",
        "h++",
        "cs",
        "m",
        "mm",
        "go",
        "rs",
        "ts",
        "tsx",
        "jl",
        "kt",
        "kts",
        "clj",
        "cljs",
        "cljc",
        "edn",
        "scala",
        "groovy",
        "gradle",
        "kt",
        "kts",
        "pl",
        "pm",
        "t",
        "r",
        "rb",
        "rake",
        "gemspec",
        "pp",
        "podspec",
        "scala",
        "scm",
        "ss",
        "st",
        "swift",
        "vb",
        "vbs",
        "vbe",
        "wsf",
        "wsc",
        "wsh",
        "c",
        "h",
        "cpp",
        "hpp",
        "cc",
        "hh",
        "cxx",
        "hxx",
        "c++",
        "h++",
        "cs",
        "m",
        "mm",
        "go",
        "rs",
        "ts",
        "tsx",
        "jl",
        "kt",
        "kts",
        "clj",
        "cljs",
        "cljc",
        "edn",
        "scala",
        "groovy",
        "gradle",
        "kt",
        "kts",
        "pl",
        "pm",
        "t",
        "r",
        "rb",
        "rake",
        "gemspec",
        "pp",
        "podspec",
        "scala",
        "scm",
        "ss",
        "st",
        "swift",
        "vb",
        "vbs",
        "vbe",
        "wsf",
        "wsc",
        "wsh",
        "c",
        "h",
        "cpp",
        "hpp",
        "cc",
        "hh",
        "cxx",
        "hxx",
        "c++",
        "h++",
        "cs",
        "m",
        "mm",
        "go",
        "rs",
        "ts",
        "tsx",
        "jl",
        "kt",
        "kts",
        "clj",
        "cljs",
        "cljc",
        "edn",
        "scala",
        "groovy",
        "gradle",
        "kt",
        "kts",
      ]);
    }
    return false;
  }

  bool get isText {
    if (this is File) {
      var f = this as File;
      return f.mimeTypeType == "text" || f.fileExtensionWithoutDot.flatContainsAny(["txt", "md"]) || isSourceCode;
    }
    return false;
  }

  bool get isVideo {
    if (this is File) {
      var f = this as File;
      return f.mimeTypeType == "video" || f.fileExtensionWithoutDot.flatContainsAny(["mp4", "mkv", "webm", "flv", "mov", "wmv", "3gp", "3g2", "m4v", "avi"]);
    }
    return false;
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

  date get lastModified {
    if (this is File) {
      return (this as File).lastModifiedSync();
    }
    if (this is Directory) {
      return (this as Directory).listFilesRecursiveSync.map((e) => e.lastModifiedSync()).maxOrNull ?? minDate;
    }
    return minDate;
  }

  /// Get File or directory name
  String get name => path.basename(this.path);

  /// Get File or directory name without extension
  String get nameWithoutExtension => path.basenameWithoutExtension(this.path);

  /// Get the parent directory of the file or directory
  string get relativePath => relativePathFrom(null);

  /// Get the size of the file or directory
  string get shortSize => size.formatFileSize;

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

  /// Get the title of the file or directory.
  ///
  /// The title is the name of the file or directory without the extension. If the name is camelCase or snake_case, it will be converted into Title Case
  string get title => nameWithoutExtension.friendlyTitle();

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

  /// Delete empty directories and files.
  /// An empty file is a file that has a length of 0 bytes.
  /// An empty directory is a directory that contains no files or directories
  Future<void> cleanEmpty() async {
    if (await exists()) {
      if (this is File) {
        if (isEmpty) {
          consoleLog("Deleting empty directory: $this");
          await delete();
        }
        await parent.cleanEmpty();
      } else if (this is Directory) {
        for (var e in (this as Directory).listSync()) {
          await e.cleanEmpty();
        }
        if (isEmpty) {
          consoleLog("Deleting empty directory: $this");
          await delete();
        }
      }
    }
  }

  Future<Directory> copyTo(Directory destination, [bool skipTopDirectory = false]) async {
    if (this is Directory) {
      return (this as Directory).copy(destination, skipTopDirectory);
    }
    if (this is File) {
      await destination.create(recursive: true);
      var p = path.join(destination.path, name).fixPath;
      await (this as File).copy(p);
    }
    return destination;
  }

  /// Get the type description of the file or directory
  string localizedTypeDescription(BuildContext context) {
    if (this is File) {
      return context.translations.file;
    }
    if (this is Directory) {
      return context.translations.directory;
    }
    return context.translations.unknown;
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
      if (this is File) "md5CheckSum": await (this as File).md5Checksum,
      if (this is Directory) "count": (this as Directory).count,
      if (this is Directory) "children": [for (var e in (this as Directory).listSync()) await e.toJson(rootUrlPath: rootUrlPath + e.relativePathFrom(e.parent.path))],
    };
  }

  Uri url(string rootUrlPath) {
    rootUrlPath = rootUrlPath.ifBlank("/");
    string s = path.join(rootUrlPath, relativePath.removeFirstEqual(rootUrlPath)).fixSlash(false);
    return Uri.parse(s);
  }
}
