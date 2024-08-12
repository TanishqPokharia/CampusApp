import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CookieStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveCookie(String value) async {
    await _storage.write(key: 'Cookie', value: value);
  }

  Future<String?> getCookie() async {
    return await _storage.read(key: 'Cookie');
  }

  Future<void> deleteCookie() async {
    await _storage.delete(key: 'Cookie');
  }
}
