enum UserRole { shop, supplier }

extension UserRoleExtension on UserRole {
  String get value {
    switch (this) {
      case UserRole.shop:
        return 'shop';
      case UserRole.supplier:
        return 'supplier';
    }
  }

  static UserRole fromString(String role) {
    switch (role) {
      case 'shop':
        return UserRole.shop;
      case 'supplier':
        return UserRole.supplier;
      default:
        throw Exception('Unknown user role: $role');
    }
  }
}
