part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  final UserEntity user;

  const Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class EmailNotVerified extends AuthState {
  final UserEntity user;
  const EmailNotVerified(this.user);

  @override
  List<Object?> get props => [user];
}

class PasswordResetEmailSent extends AuthState {
  const PasswordResetEmailSent();
}

class VerificationEmailSent extends AuthState {
  final UserEntity user;
  const VerificationEmailSent(this.user);

  @override
  List<Object?> get props => [user];
}

class RecheckEmailNotVerified extends AuthState {
  final UserEntity user;
  const RecheckEmailNotVerified(this.user);

  @override
  List<Object?> get props => [user];
}
