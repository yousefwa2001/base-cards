import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../value_objects/auth_status.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Stream<AuthStatus> watchAuthStatus();
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, Unit>> sendEmailVerification();
  Future<Either<Failure, bool>> checkEmailVerified();
  Future<Either<Failure, Unit>> sendPasswordResetEmail({required String email});
}
