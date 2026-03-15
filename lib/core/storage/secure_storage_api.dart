import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageApi {
  final FlutterSecureStorage _storage;

  const SecureStorageApi(this._storage);

  static const _keyLocale = 'locale';
  static const _uidKey = 'uid';
  static const _userRoleKey = 'userRole';
  static const _userNameKey = 'userName';
  Future<void> clearAuth() async {
    await _storage.delete(key: _uidKey);
    await _storage.delete(key: _userRoleKey);
    await _storage.delete(key: _userNameKey);
  }

  Future<void> setLocale(String code) async {
    await _storage.write(key: _keyLocale, value: code);
  }

  Future<String?> getLocale() async {
    return _storage.read(key: _keyLocale);
  }

  Future<void> setUid(String uid) async {
    await _storage.write(key: _uidKey, value: uid);
  }

  Future<String?> getUid() async {
    return await _storage.read(key: _uidKey);
  }

  Future<void> setUserRole(String userRole) async {
    await _storage.write(key: _userRoleKey, value: userRole);
  }

  Future<String?> getUserRole() async {
    return await _storage.read(key: _userRoleKey);
  }

  Future<void> setUserName(String userName) async {
    await _storage.write(key: _userNameKey, value: userName);
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: _userNameKey);
  }
}
