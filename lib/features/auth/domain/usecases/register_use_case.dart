import 'package:dartz/dartz.dart';
import 'package:base_cards/core/errors/failures.dart';
import 'package:base_cards/features/auth/domain/entities/user_entity.dart';
import 'package:base_cards/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) {
    return repository.registerWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      phoneNumber: phoneNumber,
    );
  }
}
