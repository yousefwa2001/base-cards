import 'package:equatable/equatable.dart';
import '../entities/user_entity.dart';

abstract class AuthStatus extends Equatable {
  const AuthStatus();
  @override
  List<Object?> get props => [];
}

class AuthenticatedStatus extends AuthStatus {
  final UserEntity user;
  const AuthenticatedStatus(this.user);

  @override
  List<Object?> get props => [user];
}

class UnauthenticatedStatus extends AuthStatus {
  const UnauthenticatedStatus();
}
