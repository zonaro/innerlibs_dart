import 'dart:convert';
import 'dart:io';

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
class JsonDataDirectory<T, K> {
  final Directory directory;
  final K Function(T) idGetterFunction;
  final JsonMap Function(T) toJsonFunction;
  final T Function(JsonMap) fromJsonFunction;
  final String key; // New parameter for encryption key

  JsonDataDirectory({
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

  /// Creates a file in the data directory with the given data.
  ///
  /// The [data] parameter represents the data to be stored in the file.
  /// The [idGetterFunction] is a function that retrieves the ID for the data.
  /// The [toJsonFunction] is a function that converts the data to JSON format.
  /// The [key] is an optional encryption key used to encrypt the JSON data.
  ///
  /// Throws an exception if there is an error writing the file.
  K createSync(T data) {
    final id = idGetterFunction(data);
    final file = File('${directory.path}/$id.json');
    final json = jsonEncode(toJsonFunction(data));
    final encryptedJson = key.isNotBlank ? json.applyXorEncrypt(key) : json; // Encrypt the JSON if key is not blank
    file.writeAsStringSync(encryptedJson);
    return id;
  }

  /// Deletes the data with the specified ID.
  ///
  /// Throws an exception if the data with the given ID does not exist.
  ///
  /// Returns the ID of the deleted data.
  Future<K> delete(K id) async {
    final file = File('${directory.path}/$id.json');
    if (!await file.exists()) {
      throw Exception('Data with ID $id does not exist.');
    }
    await file.delete();
    return id;
  }

  /// Deletes the data with the specified ID.
  ///
  /// Throws an exception if the data with the given ID does not exist.
  ///
  /// Returns the ID of the deleted data.
  K deleteSync(K id) {
    final file = File('${directory.path}/$id.json');
    if (!file.existsSync()) {
      throw Exception('Data with ID $id does not exist.');
    }
    file.deleteSync();
    return id;
  }

  /// Retrieves a list of objects of type [T] from the directory.
  ///
  /// This method reads all the files in the [directory] and filters out the files that have a '.json' extension.
  /// For each filtered file, it reads the contents, decrypts the JSON if [key] is not blank, and converts it to an object of type [T].
  /// The resulting objects are added to a list, which is returned at the end.
  ///
  /// Returns a [Future] that completes with an [Iterable] of objects of type [T].
  Future<Iterable<T>> list() async {
    List<T> list = [];

    if (await directory.exists()) {
      await for (var entity in directory.list()) {
        if (entity is File && entity.path.endsWith('.json')) {
          final encryptedJson = await entity.readAsString();
          final json = key.isNotBlank ? encryptedJson.applyXorEncrypt(key) : encryptedJson; // Decrypt the JSON if key is not blank
          final data = fromJsonFunction(jsonDecode(json));
          list.add(data);
        }
      }
    }
    return list;
  }

  /// Retrieves a list of objects of type [T] from the directory.
  ///
  /// This method reads all the files in the [directory] and filters out the files that have a '.json' extension.
  /// For each filtered file, it reads the contents, decrypts the JSON if [key] is not blank, and converts it to an object of type [T].
  /// The resulting objects are added to a list, which is returned at the end.
  ///
  /// Returns a  [Iterable] of objects of type [T].
  Iterable<T> listSync() {
    return directory.listFilesSync.map((file) {
      final encryptedJson = file.readAsStringSync();
      final json = key.isNotBlank ? encryptedJson.applyXorEncrypt(key) : encryptedJson; // Decrypt the JSON if key is not blank
      return fromJsonFunction(jsonDecode(json));
    });
  }

  /// Reads the data with the specified ID.
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

  /// Reads the data with the specified ID.
  T? readSync(K id) {
    final file = File('${directory.path}/$id.json');
    if (!file.existsSync()) {
      return null;
    }
    final encryptedJson = file.readAsStringSync();
    final json = key.isNotBlank ? encryptedJson.applyXorEncrypt(key) : encryptedJson; // Decrypt the JSON if key is not blank
    return fromJsonFunction(jsonDecode(json));
  }

  /// Updates the data with the specified ID.
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

  /// Updates the data with the specified ID.
  K updateSync(T data) {
    final id = idGetterFunction(data);
    final file = File('${directory.path}/$id.json');
    if (!file.existsSync()) {
      throw Exception('Data with ID $id does not exist.');
    }
    final json = jsonEncode(toJsonFunction(data));
    final encryptedJson = key.isNotBlank ? json.applyXorEncrypt(key) : json; // Encrypt the JSON if key is not blank
    file.writeAsStringSync(encryptedJson);
    return id;
  }

/// Create or update the data with the specified ID.
  Future<K> upsert(T data) async {
    final id = idGetterFunction(data);
    final file = File('${directory.path}/$id.json');
    final json = jsonEncode(toJsonFunction(data));
    final encryptedJson = key.isNotBlank ? json.applyXorEncrypt(key) : json; // Encrypt the JSON if key is not blank
    await file.writeAsString(encryptedJson);
    return id;
  }

  K upsertSync(T data) {
    final id = idGetterFunction(data);
    final file = File('${directory.path}/$id.json');
    final json = jsonEncode(toJsonFunction(data));
    final encryptedJson = key.isNotBlank ? json.applyXorEncrypt(key) : json; // Encrypt the JSON if key is not blank
    file.writeAsStringSync(encryptedJson);
    return id;
  }
}
