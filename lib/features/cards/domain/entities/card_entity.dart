import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String? id;

  final String code;

  final String category;
  final String region;

  final String categoryId;
  final String regionId;
  final String valueId;
  final String serialNumber;
  final int price;
  final int purchasePrice;
  final int value;

  final bool isSold;
  final String? buyerId;
  final String? buyerName;
  final DateTime? soldAt;
  final int? expiryMonth;
  final int? expiryYear;
  final String createdBy;
  final DateTime? createdAt;

  const CardEntity({
    this.id,
    required this.code,
    required this.category,
    required this.region,
    required this.categoryId,
    required this.regionId,
    required this.valueId,
    required this.price,
    required this.purchasePrice,
    required this.value,
    this.expiryMonth,
    this.expiryYear,
    this.isSold = false,
    this.buyerId,
    this.buyerName,
    this.soldAt,
    required this.createdBy,
    this.createdAt,
    required this.serialNumber,
  });

  @override
  List<Object?> get props => [
    id,
    code,
    serialNumber,
    expiryMonth,
    expiryYear,
    category,
    region,
    categoryId,
    regionId,
    valueId,
    price,
    value,
    isSold,
    buyerId,
    buyerName,
    soldAt,
    createdBy,
    createdAt,
  ];
}
