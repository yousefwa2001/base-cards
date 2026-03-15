import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() {
    return repository.signOut();
  }
}
