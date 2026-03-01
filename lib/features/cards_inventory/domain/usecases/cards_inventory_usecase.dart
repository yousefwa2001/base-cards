import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

import '../../../cards/domain/entities/card_entity.dart';
import '../../data/datasources/cards_inventory_remote_data_source.dart';
import '../repositories/cards_inventory_repository.dart';

class CardsInventoryUseCase {
  final CardsInventoryRepository repository;
  CardsInventoryUseCase({required this.repository});

  Future<Either<Failure, List<CardEntity>>> call({
    String? categoryId,
    String? regionId,
    String? valueId,
    InventoryStatus status = InventoryStatus.all,
  }) {
    return repository.getCardsInventory(
      categoryId: categoryId,
      regionId: regionId,
      valueId: valueId,
      status: status,
    );
  }
}
