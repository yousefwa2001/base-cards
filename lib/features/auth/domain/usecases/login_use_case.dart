import 'package:dartz/dartz.dart';
import 'package:base_cards/core/errors/failures.dart';
import 'package:base_cards/core/usecases/usecase.dart';
import 'package:base_cards/features/auth/domain/entities/user_entity.dart';
import 'package:base_cards/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}
