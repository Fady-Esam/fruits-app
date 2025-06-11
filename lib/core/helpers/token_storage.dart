import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenStorage {
  // Create an instance of FlutterSecureStorage
  static final _storage = FlutterSecureStorage();

  // Store the token securely
  static Future<void> storeToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  // Retrieve the stored token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  // Delete the token when the user logs out
  static Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt_token');
  }
}
