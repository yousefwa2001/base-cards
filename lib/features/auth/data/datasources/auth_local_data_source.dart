abstract class AuthLocalDataSource {

  Future<void> cacheUser({
    required String uid,
    required String role,
    required String name,
  });
  Future<String?> getRole();
  Future<String?> getName();
  Future<void> clearAuth();
}
