import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.role,
    required super.name,
    required super.balance,
    required super.isVerified,
  });

  factory UserModel.fromMap(String uid, Map<String, dynamic> map) {
    return UserModel(
      uid: uid,
      email: map['email'] as String? ?? '',
      role: map['role'] as String? ?? 'shop',
      name: map['name'] as String? ?? 'name',
      balance: (map['balance'] as num?)?.toInt() ?? 0,
      isVerified: map['isVerified'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'role': role,
      'name': name,
      'balance': balance,
      'isVerified': isVerified,
    };
  }

  Map<String, dynamic> updateBalance({required double newBalance}) {
    return {'balance': newBalance};
  }

  Map<String, dynamic> updateIsVerified({required bool value}) {
    return {'isVerified': value};
  }
}
