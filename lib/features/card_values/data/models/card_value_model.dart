import '../../domain/entities/card_value_entity.dart';

class CardValueModel extends CardValueEntity {
  const CardValueModel({
    required super.id,
    required super.value,
    required super.price,
    required super.purchasePrice,
    required super.isActive,
  });

  factory CardValueModel.fromFirestore(String id, Map<String, dynamic> data) {
    final rawValue = data['value'];

    final rawPrice = data['price'];
    final rawPurchasePrice = data['purchase_price'];

    return CardValueModel(
      id: id,
      value:
          rawValue is num ? rawValue.toInt() : int.parse(rawValue.toString()),
      price: (rawPrice as num?)?.toInt() ?? 0,
      purchasePrice: (rawPurchasePrice as num?)?.toInt() ?? 0,
      isActive: data['isActive'],
    );
  }
}
