import 'package:equatable/equatable.dart';

class PurchaseEntity extends Equatable {
  final String? id;
  final String cardId;
  final String code;

  final int? expiryMonth;
  final int? expiryYear;
  final String serialNumber;

  final int price;

  final String category;
  final String categoryId;

  final String region;
  final String regionId;

  final int value;
  final String valueId;

  final String buyerId;

  final DateTime? purchasedAt;

  const PurchaseEntity({
    this.id,
    required this.cardId,
    required this.code,
    required this.serialNumber,
    required this.price,
    required this.category,
    required this.categoryId,
    required this.region,
    required this.regionId,
    required this.value,
    required this.valueId,
    required this.buyerId,
    this.purchasedAt,
    this.expiryMonth,
    this.expiryYear,
  });

  @override
  List<Object?> get props => [
    id,
    cardId,
    code,
    expiryMonth,
    expiryYear,
    serialNumber,
    price,
    category,
    categoryId,
    region,
    regionId,
    value,
    valueId,
    buyerId,
    purchasedAt,
  ];
}
