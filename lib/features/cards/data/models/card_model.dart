import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  const CardModel({
    super.id,
    required super.code,
    required super.serialNumber,
    required super.category,
    required super.region,
    required super.categoryId,
    required super.regionId,
    required super.valueId,
    required super.price,
    required super.purchasePrice,
    required super.value,
    super.expiryMonth,
    super.expiryYear,
    super.isSold,
    super.buyerId,
    super.buyerName,
    super.soldAt,
    required super.createdBy,
    super.createdAt,
  });

  factory CardModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CardModel(
      id: documentId,
      code: map['code'] ?? '',
      serialNumber: map["serial_number"] ?? '',
      expiryMonth: map['expiryMonth'],
      expiryYear: map['expiryYear'],
      category: map['category'],
      region: map['region'],

      categoryId: map['categoryId'],
      regionId: map['regionId'],
      valueId: map['valueId'],

      price: (map['price'] as num?)?.toInt() ?? 0,
      purchasePrice: (map['purchase_price'] as num?)?.toInt() ?? 0,
      value: (map['value'] as num?)?.toInt() ?? 0,

      isSold: map['isSold'] ?? false,
      buyerId: map['buyerId'],
      buyerName: map['buyerName'],
      soldAt:
          map['soldAt'] != null ? (map['soldAt'] as Timestamp).toDate() : null,

      createdBy: map['createdBy'] ?? '',
      createdAt:
          map['createdAt'] != null
              ? (map['createdAt'] as Timestamp).toDate()
              : null,
    );
  }

  CardEntity toEntity() => CardEntity(
    id: id,
    serialNumber: serialNumber,
    expiryMonth: expiryMonth,
    expiryYear: expiryYear,
    code: code,
    category: category,
    region: region,
    categoryId: categoryId,
    regionId: regionId,
    valueId: valueId,
    price: price,
    purchasePrice: purchasePrice,
    value: value,
    isSold: isSold,
    buyerId: buyerId,
    buyerName: buyerName,
    soldAt: soldAt,
    createdBy: createdBy,
    createdAt: createdAt,
  );

  factory CardModel.fromEntity(CardEntity entity) {
    return CardModel(
      id: entity.id,
      serialNumber: entity.serialNumber,
      code: entity.code,
      category: entity.category,
      region: entity.region,
      categoryId: entity.categoryId,
      regionId: entity.regionId,
      valueId: entity.valueId,
      price: entity.price,
      purchasePrice: entity.purchasePrice,
      value: entity.value,
      isSold: entity.isSold,
      buyerId: entity.buyerId,
      buyerName: entity.buyerName,
      soldAt: entity.soldAt,
      createdBy: entity.createdBy,
      createdAt: entity.createdAt,
    );
  }
  Map<String, dynamic> toMapForCreate() {
    return {
      'code': code,
      'serial_number': serialNumber,
      'expiryYear': expiryYear,
      'expiryMonth': expiryMonth,
      'category': category,
      'region': region,

      'categoryId': categoryId,
      'regionId': regionId,
      'valueId': valueId,

      'price': price,
      'purchase_price': purchasePrice,
      'value': value,

      'isSold': false,
      'buyerId': null,
      'buyerName': null,
      'soldAt': null,

      'createdBy': createdBy,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> soldUpdateMap({
    required String buyerUid,
    required String buyerName,
  }) {
    return {
      'isSold': true,
      'buyerId': buyerUid,
      'buyerName': buyerName,
      'soldAt': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> codeUpdateMap({
    required String newCode,
    required String serialNumber,
    required int? expiryYear,
    required int? expiryMonth,
  }) {
    return {
      'code': newCode,
      'serial_number': serialNumber,
      'expiryYear': expiryYear,
      'expiryMonth': expiryMonth,
    };
  }
}
