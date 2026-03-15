class UserEntity {
  final String uid;
  final String email;
  final String role;
  final String name;
  final String phoneNumber;
  final int balance;
  final bool isVerified;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.role,
    required this.name,
    required this.phoneNumber,
    required this.balance,
    required this.isVerified,
  });
}
