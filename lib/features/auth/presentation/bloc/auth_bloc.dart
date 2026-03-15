import 'dart:async';

import 'package:base_cards/core/utils/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/check_email_verified_use_case.dart';
import '../../domain/usecases/forgot_password_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/logout_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../../domain/usecases/send_email_verification_use_case.dart';
import '../../domain/usecases/watch_auth_status_use_case.dart';
import '../../domain/value_objects/auth_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final WatchAuthStatusUseCase watchAuthStatusUseCase;
  final CheckEmailVerifiedUseCase checkEmailVerifiedUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  StreamSubscription<AuthStatus>? _sub;

  UserEntity? _currentUser;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.watchAuthStatusUseCase,
    required this.checkEmailVerifiedUseCase,
    required this.sendEmailVerificationUseCase,
    required this.forgotPasswordUseCase,
  }) : super(const AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<SendVerificationEmailRequested>(_onSendVerificationEmailRequested);
    on<RecheckEmailVerificationRequested>(_onRecheckEmailVerificationRequested);
    on<_InternalAuthenticated>(_onInternalAuthenticated);
    on<_InternalUnauthenticated>(_onInternalUnauthenticated);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    await _sub?.cancel();
    _sub = watchAuthStatusUseCase().listen((status) {
      if (status is UnauthenticatedStatus) {
        add(const _InternalUnauthenticated());
      } else if (status is AuthenticatedStatus) {
        add(_InternalAuthenticated(status.user));
      }
    });
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final Either<Failure, UserEntity> result = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    await result.fold((f) async => emit(AuthError(f.message)), (u) async {
      _currentUser = u;

      final check = await checkEmailVerifiedUseCase();
      check.fold((f) => emit(AuthError(f.message)), (verified) {
        if (verified) {
          emit(Authenticated(u));
        } else {
          emit(EmailNotVerified(u));
        }
      });
    });
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final Either<Failure, UserEntity> result = await registerUseCase(
      email: event.email,
      password: event.password,
      name: event.name,
      phoneNumber: event.phoneNumber,
    );

    await result.fold((f) async => emit(AuthError(f.message)), (u) async {
      _currentUser = u;

      final send = await sendEmailVerificationUseCase();
      send.fold((f) => emit(AuthError(f.message)), (_) {});

      emit(EmailNotVerified(u));
    });
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final res = await logoutUseCase();
    res.fold((f) => emit(AuthError(f.message)), (_) {
      _currentUser = null;
      emit(const Unauthenticated());
    });
  }

  Future<void> _onSendVerificationEmailRequested(
    SendVerificationEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (state is AuthLoading) return;
    emit(const AuthLoading());

    final res = await sendEmailVerificationUseCase();
    res.fold((f) => emit(AuthError(f.message)), (_) {
      final u = _currentUser;
      if (u == null) {
        emit(const AuthError("User not found"));
        return;
      }
      emit(VerificationEmailSent(u));
    });
  }

  Future<void> _onRecheckEmailVerificationRequested(
    RecheckEmailVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final check = await checkEmailVerifiedUseCase();
    check.fold(
      (f) {
        AppLogger.error({"checkEmailVerified ${f.message}"});
        emit(AuthError(f.message));
      },
      (verified) {
        final u = _currentUser;

        if (u == null) {
          emit(const Unauthenticated());
          return;
        }

        if (verified) {
          AppLogger.info("verified");
          emit(Authenticated(u));
        } else {
          emit(RecheckEmailNotVerified(u));
        }
      },
    );
  }

  Future<void> _onInternalAuthenticated(
    _InternalAuthenticated event,
    Emitter<AuthState> emit,
  ) async {
    _currentUser = event.user;

    final check = await checkEmailVerifiedUseCase();
    check.fold((f) => emit(AuthError(f.message)), (verified) {
      if (verified) {
        emit(Authenticated(event.user));
      } else {
        emit(EmailNotVerified(event.user));
      }
    });
  }

  void _onInternalUnauthenticated(
    _InternalUnauthenticated event,
    Emitter<AuthState> emit,
  ) {
    _currentUser = null;
    emit(const Unauthenticated());
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final res = await forgotPasswordUseCase(email: event.email.trim());
    res.fold(
      (f) => emit(AuthError(f.message)),
      (_) => emit(const PasswordResetEmailSent()),
    );
  }
}
