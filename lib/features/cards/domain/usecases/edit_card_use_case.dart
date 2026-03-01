import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/edit_card_repository.dart';

class EditCardUseCase {
  final EditCardRepository repository;

  EditCardUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required String cardId,
    required String newCode,
    required String serialNumber,
    required int? expiryYear,
    required int? expiryMonth,
  }) {
    return repository.editCardCode(
      cardId: cardId,
      newCode: newCode,
      serialNumber: serialNumber,
      expiryYear: expiryYear,
      expiryMonth: expiryMonth,
    );
  }
}
