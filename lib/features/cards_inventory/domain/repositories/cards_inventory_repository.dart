import 'package:base_cards/features/cards/domain/entities/card_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/datasources/cards_inventory_remote_data_source.dart';

abstract class CardsInventoryRepository {
  Future<Either<Failure, List<CardEntity>>> getCardsInventory({
    String? categoryId,
    String? regionId,
    String? valueId,
    InventoryStatus status = InventoryStatus.all,
  });
}
