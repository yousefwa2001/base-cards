import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;
  ForgotPasswordUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required String email}) {
    return repository.sendPasswordResetEmail(email: email);
  }
}
