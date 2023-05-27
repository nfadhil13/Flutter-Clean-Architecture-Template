import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SecureStorage {
  const SecureStorage();

  Future<void> write({
    required String key,
    required String value,
  });
  Future<void> writeJSON({
    required String key,
    required Map<String, dynamic> json,
  });

  Future<void> remove(String key);

  Future<String?> read({required String key});

  Future<dynamic> readJSON({required String key});

  Future<Data?> readData<Data>(Data Function(Map<String, dynamic>) mapper,
      {required String key});
}

@Injectable(as: SecureStorage)
class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _secureStorage;

  const SecureStorageImpl(this._secureStorage);

  static AndroidOptions androidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  AndroidOptions _getAndroidOptions() => androidOptions();

  @override
  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
  }

  @override
  Future<void> writeJSON({
    required String key,
    required dynamic json,
  }) async {
    await write(key: key, value: jsonEncode(json));
  }

  @override
  Future<String?> read({required String key}) async {
    return await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
  }

  @override
  Future<dynamic> readJSON({required String key}) async {
    final result = await read(key: key);
    if (result == null) return null;
    return jsonDecode(result);
  }

  @override
  Future<Data?> readData<Data>(Data Function(Map<String, dynamic>) parser,
      {required String key}) async {
    final result = await read(key: key);
    if (result == null) return null;
    return parser(jsonDecode(result));
  }

  @override
  Future<void> remove(String key) async {
    await _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
  }
}
