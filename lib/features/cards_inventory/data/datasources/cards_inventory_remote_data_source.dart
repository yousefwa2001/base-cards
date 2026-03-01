import '../../../cards/data/models/card_model.dart';

enum InventoryStatus { all, sold, available }

abstract class CardsInventoryRemoteDataSource {
  Future<List<CardModel>> getCardsInventory({
    String? categoryId,
    String? regionId,
    String? valueId,
    InventoryStatus status,
  });
}
