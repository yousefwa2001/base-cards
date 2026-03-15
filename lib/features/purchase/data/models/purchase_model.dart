import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/purchase_entity.dart';

class PurchaseModel extends PurchaseEntity {
  const PurchaseModel({
    super.id,
    required super.cardId,
    required super.code,
    required super.serialNumber,

    required super.price,
    required super.category,
    required super.categoryId,
    required super.region,
    required super.regionId,
    required super.value,
    required super.valueId,
    required super.buyerId,
    super.purchasedAt,
    super.expiryMonth,
    super.expiryYear,
  });

  factory PurchaseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return PurchaseModel(
      id: documentId,
      cardId: map['cardId'] ?? '',
      code: map['code'] ?? '',
      price: (map['price'] as num?)?.toInt() ?? 0,
      category: map['category'] ?? '',
      categoryId: map['categoryId'] ?? '',
      serialNumber: map['serial_number'] ?? '',
      expiryMonth: map['expiryMonth'],
      expiryYear: map['expiryYear'],
      region: map['region'] ?? '',
      regionId: map['regionId'] ?? '',
      value: (map['value'] as num?)?.toInt() ?? 0,
      valueId: map['valueId'] ?? '',
      buyerId: map['buyerId'] ?? '',
      purchasedAt:
          map['purchasedAt'] != null
              ? (map['purchasedAt'] as Timestamp).toDate()
              : null,
    );
  }

  Map<String, dynamic> toMapForCreate() {
    return {
      'cardId': cardId,
      'code': code,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
      'serial_number': serialNumber,
      'price': price,
      'category': category,
      'categoryId': categoryId,
      'region': region,
      'regionId': regionId,
      'value': value,
      'valueId': valueId,
      'buyerId': buyerId,
      'purchasedAt': FieldValue.serverTimestamp(),
    };
  }
}
