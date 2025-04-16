import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final storage = FlutterSecureStorage(aOptions: _androidOptions);

  Future<void> writeString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readString(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteString(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
