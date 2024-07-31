import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

extension FileExtensionPlus on File {
  /// Convert File to base64 sync
  String? get base64 {
    List<int> fileBytes = readAsBytesSync();
    return base64Encode(fileBytes);
  }

  String get dataURI => "data:$mimeType;base64,$base64";

  /// Get File name without extension
  String get fileNameWithoutExtension => path.basenameWithoutExtension(this.path);

  /// Get File extension
  String get fileExtension => path.extension(this.path);

  string get fileExtensionWithoutDot => path.extension(this.path).removeFirstEqual(".");

  /// Get the MD5 checksum of the file
  Future<String> get md5Checksum async {
    var st = openRead();
    final checksum = (await md5.bind(st).first).toString();
    return checksum;
  }

  string get mimeType => lookupMimeType(name) ?? "application/octet-stream";
}

extension DirectoryExtensionPlus on Directory {
  /// Get all files and directories in the directory
  List<FileSystemEntity> get listAll => listSync(recursive: true);

  /// Get all files in the directory
  List<File> get listFiles => listSync().whereType<File>().toList();

  /// Get all directories in the directory
  List<Directory> get listDirectories => listSync().whereType<Directory>().toList();

  /// Get all files and directories in the directory
  List<FileSystemEntity> get listAllSync => listSync(recursive: true);

  /// Get all files in the directory
  List<File> get listFilesSync => listSync().whereType<File>().toList();

  /// Get all directories in the directory
  List<Directory> get listDirectoriesSync => listSync().whereType<Directory>().toList();

  int get count => listSync().length;
}

extension FileSystemEntityExtensionPlus on FileSystemEntity {
  int get index => parent.listSync().map((x) => x.id).toList().indexOf(id);

  int get id => this.path.hashCode;

  string get title => nameWithoutExtension.friendlyName;

  /// Get File or directory name
  String get name => path.basename(this.path);

  String get nameWithoutExtension => path.basenameWithoutExtension(this.path);

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

  string get shortSize => size.formatFileSize;

  String? get directoryName {
    if (this is File) {
      return path.dirname(this.path);
    }
    if (this is Directory) {
      return this.path;
    }
    return path.basename(this.path);
  }

  string get typeDescription {
    if (this is File) {
      return "File";
    }
    if (this is Directory) {
      return "Directory";
    }
    return "Unknown";
  }

  string relativePathFrom(string? rootPath) => path.relative(this.path, from: rootPath);

  string get relativePath => relativePathFrom(null);

  Uri url(string domain, string rootUrlPath, [bool secure = true]) {
    string s = path.join(rootUrlPath, relativePath.removeFirstEqual(rootUrlPath)).fixSlash(false);
    return secure ? Uri.https(domain, s) : Uri.http(domain, s);
  }

  Future<JsonMap> toJson({string domain = "localhost", string rootUrlPath = "/"}) async {
    return {
      "index": index,
      "title": title,
      "name": name,
      "fullName": this.path,
      "size": size,
      "shortSize": shortSize,
      "typeDescription": typeDescription,
      if (this is Directory) "count": (this as Directory).count,
      "relativePath": relativePath,
      "url": url(domain, rootUrlPath).toString(),
      if (this is File) "MD5CheckSum": await (this as File).md5Checksum,
      if (this is File) "Mime": (this as File).mimeType,
      if (this is Directory) "Children": [for (var e in (this as Directory).listSync()) await e.toJson(domain: domain, rootUrlPath: rootUrlPath + e.relativePathFrom(e.parent.path))],
    };
  }
}
