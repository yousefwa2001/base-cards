import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

class SendEmailVerificationUseCase {
  final AuthRepository repository;
  SendEmailVerificationUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() => repository.sendEmailVerification();
}
