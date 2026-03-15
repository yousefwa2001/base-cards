part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {
  const AuthStarted();
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String  phoneNumber;

  const RegisterRequested({
    required this.email,
    required this.password,
    required this.name,
    required this. phoneNumber,
  });

  @override
  List<Object> get props => [email, password, name,  phoneNumber];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

class _InternalAuthenticated extends AuthEvent {
  final UserEntity user;
  const _InternalAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class _InternalUnauthenticated extends AuthEvent {
  const _InternalUnauthenticated();
}

class SendVerificationEmailRequested extends AuthEvent {
  const SendVerificationEmailRequested();
}

class RecheckEmailVerificationRequested extends AuthEvent {
  const RecheckEmailVerificationRequested();
}

class ForgotPasswordRequested extends AuthEvent {
  final String email;
  const ForgotPasswordRequested({required this.email});

  @override
  List<Object?> get props => [email];
}
