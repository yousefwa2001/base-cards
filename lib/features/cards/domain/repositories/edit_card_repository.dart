import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class EditCardRepository {
  Future<Either<Failure, Unit>> editCardCode({
    required String cardId,
    required String newCode,
    required String serialNumber,
    required int? expiryYear,
    required int? expiryMonth,
  });
}
