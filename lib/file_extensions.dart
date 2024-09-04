import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

extension DirectoryExtensionPlus on Directory {
  int get count => listSync().length;

  /// Get all files and directories in the directory
  List<FileSystemEntity> get listAll => listSync(recursive: true);

  /// Get all files and directories in the directory
  List<FileSystemEntity> get listAllSync => listSync(recursive: true);

  /// Get all directories in the directory
  List<Directory> get listDirectories => listSync().whereType<Directory>().toList();

  /// Get all directories in the directory
  List<Directory> get listDirectoriesSync => listSync().whereType<Directory>().toList();

  /// Get all files in the directory
  List<File> get listFiles => listSync().whereType<File>().toList();

  /// Get all files in the directory
  List<File> get listFilesSync => listSync().whereType<File>().toList();
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

  int get id => this.path.hashCode;

  int get index => parent.listSync().map((x) => x.id).toList().indexOf(id);

  /// Get File or directory name
  String get name => path.basename(this.path);

  String get nameWithoutExtension => path.basenameWithoutExtension(this.path);

  string get relativePath => relativePathFrom(null);

  string get shortSize => size.formatFileSize;

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

  string get title => nameWithoutExtension.friendlyName;

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
