import '../../../../core/storage/secure_storage_api.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageApi storage;
  AuthLocalDataSourceImpl({required this.storage});

  @override
  Future<void> cacheUser({
    required String uid,
    required String role,
    required String name,
  }) async {
    await storage.setUid(uid);
    await storage.setUserRole(role);
    await storage.setUserName(name);
  }

  @override
  Future<String?> getRole() => storage.getUserRole();

  @override
  Future<String?> getName() => storage.getUserName();

  @override
  Future<void> clearAuth() => storage.clearAuth();
}
