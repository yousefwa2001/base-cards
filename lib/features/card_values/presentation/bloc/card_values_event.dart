import 'package:equatable/equatable.dart';

abstract class CardValuesEvent extends Equatable {
  const CardValuesEvent();

  @override
  List<Object> get props => [];
}

class LoadCardValuesEvent extends CardValuesEvent {
  final String categoryId;
  final String regionId;
  final Future<bool> isSupplier;

  const LoadCardValuesEvent({
    required this.categoryId,
    required this.regionId,
    required this.isSupplier,
  });

  @override
  List<Object> get props => [categoryId, regionId, isSupplier];
}

class UpdatePurchasePriceEvent extends CardValuesEvent {
  final String categoryId;
  final String regionId;
  final String valueId;
  final int purchasePrice;
  final Future<bool> isSupplier;

  const UpdatePurchasePriceEvent({
    required this.categoryId,
    required this.regionId,
    required this.valueId,
    required this.purchasePrice,
    required this.isSupplier,
  });

  @override
  List<Object> get props => [
    categoryId,
    regionId,
    valueId,
    purchasePrice,
    isSupplier,
  ];
}
