import 'package:base_cards/core/utils/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/value_objects/auth_status.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepositoryImpl({required this.remote, required this.local});

  @override
  Stream<AuthStatus> watchAuthStatus() async* {
    await for (final fbUser in remote.authStateChanges()) {
      if (fbUser == null) {
        yield const UnauthenticatedStatus();
        continue;
      }

      try {
        final model = await remote.getOrCreateUser(
          uid: fbUser.uid,
          email: fbUser.email ?? '',
        );

        await local.cacheUser(
          uid: model.uid,
          role: model.role,
          name: model.name,
        );

        yield AuthenticatedStatus(model);
      } catch (_) {
        yield const UnauthenticatedStatus();
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final uid = await remote.signIn(email: email, password: password);

      final model = await remote.getOrCreateUser(uid: uid, email: email);

      await local.cacheUser(uid: model.uid, role: model.role, name: model.name);

      return Right(model);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.code));
    } on FirebaseException catch (e) {
      AppLogger.error(e);
      return Left(Failure(e.code));
    } catch (e) {
      AppLogger.error(e);
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remote.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    } finally {
      await local.clearAuth();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      final uid = await remote.signUp(email: email, password: password);

      final model = await remote.createUserDoc(
        uid: uid,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
      );

      await local.cacheUser(uid: model.uid, role: model.role, name: model.name);

      return Right(model);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.code));
    } on FirebaseException catch (e) {
      AppLogger.error(e);
      return Left(Failure(e.code));
    } catch (e) {
      AppLogger.error(e);
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendEmailVerification() async {
    try {
      await remote.sendEmailVerification();
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.code));
    } catch (e) {
      return const Left(Failure('unexpected-error'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkEmailVerified() async {
    try {
      await remote.reloadUser();
      final verified = await remote.isEmailVerified();
      return Right(verified);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.code));
    } catch (e) {
      return const Left(Failure('unexpected-error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await remote.sendPasswordResetEmail(email: email);
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.code));
    } on FirebaseException catch (e) {
      AppLogger.error(e);
      return Left(Failure(e.code));
    } catch (e) {
      AppLogger.error(e);
      return Left(Failure('Unexpected error: ${e.toString()}'));
    }
  }
}
