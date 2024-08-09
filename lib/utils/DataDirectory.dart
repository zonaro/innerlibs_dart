import 'dart:convert';
import 'dart:io';

import 'package:innerlibs/file_extensions.dart';
import 'package:innerlibs/innerlibs.dart';

/// A utility class for managing JSON data in a directory.
///
/// This class provides methods for creating, reading, updating, and deleting JSON data files in a specified directory.
/// It also provides a method for listing all the JSON data files in the directory.
///
/// The class requires a [Directory] object representing the directory where the JSON data files are stored.
/// It also requires four functions:
/// - [idGetterFunction]: A function that takes an object of type [T] and returns a unique identifier for that object.
/// - [toJsonFunction]: A function that takes an object of type [T] and converts it to a [JsonMap].
/// - [fromJsonFunction]: A function that takes a [JsonMap] and converts it to an object of type [T].
///
/// Example usage:
/// ```dart
/// final directory = Directory('/path/to/data');
/// final dataDirectory = JsonDataDiretory(
///   directory: directory,
///   idGetterFunction: (data) => data.id,
///   toJsonFunction: (data) => data.toJson(),
///   fromJsonFunction: (json) => Data.fromJson(json),
/// );
/// ```
class JsonDataDiretory<T, K> {
  final Directory directory;
  final K Function(T) idGetterFunction;
  final JsonMap Function(T) toJsonFunction;
  final T Function(JsonMap) fromJsonFunction;
  final String key; // New parameter for encryption key

  JsonDataDiretory({
    required this.directory,
    required this.idGetterFunction,
    required this.toJsonFunction,
    required this.fromJsonFunction,
    this.key = '', // Default value for encryption key is empty string
  });

  /// Creates a file in the data directory with the given data.
  ///
  /// The [data] parameter represents the data to be stored in the file.
  /// The [idGetterFunction] is a function that retrieves the ID for the data.
  /// The [toJsonFunction] is a function that converts the data to JSON format.
  /// The [key] is an optional encryption key used to encrypt the JSON data.
  ///
  /// Throws an exception if there is an error writing the file.
  Future<K> create(T data) async {
    final id = idGetterFunction(data);
    final file = File('${directory.path}/$id.json');
    final json = jsonEncode(toJsonFunction(data));
    final encryptedJson = key.isNotEmpty ? json.applyXorEncrypt(key) : json; // Encrypt the JSON if key is not blank
    await file.writeAsString(encryptedJson);
    return id;
  }

  Future<T?> read(String id) async {
    final file = File('${directory.path}/$id.json');
    if (!await file.exists()) {
      return null;
    }
    final encryptedJson = await file.readAsString();
    final json = key.isNotBlank ? encryptedJson.applyXorEncrypt(key) : encryptedJson; // Decrypt the JSON if key is not blank
    final data = fromJsonFunction(jsonDecode(json));
    return data;
  }

  Future<K> update(T data) async {
    final id = idGetterFunction(data);
    final file = File('${directory.path}/$id.json');
    if (!await file.exists()) {
      throw Exception('Data with ID $id does not exist.');
    }
    final json = jsonEncode(toJsonFunction(data));
    final encryptedJson = key.isNotBlank ? json.applyXorEncrypt(key) : json; // Encrypt the JSON if key is not blank
    await file.writeAsString(encryptedJson);
    return id;
  }

  Future<K> upsert(T data) async {
    final id = idGetterFunction(data);
    final file = File('${directory.path}/$id.json');
    final json = jsonEncode(toJsonFunction(data));
    final encryptedJson = key.isNotBlank ? json.applyXorEncrypt(key) : json; // Encrypt the JSON if key is not blank
    await file.writeAsString(encryptedJson);
    return id;
  }

  Future<K> delete(K id) async {
    final file = File('${directory.path}/$id.json');
    if (!await file.exists()) {
      throw Exception('Data with ID $id does not exist.');
    }
    await file.delete();
    return id;
  }

  Future<Iterable<T>> list() async {
    return directory.listFilesSync.map((file) {
      final encryptedJson = file.readAsStringSync();
      final json = key.isNotBlank ? encryptedJson.applyXorEncrypt(key) : encryptedJson; // Decrypt the JSON if key is not blank
      return fromJsonFunction(jsonDecode(json));
    });
  }
}
