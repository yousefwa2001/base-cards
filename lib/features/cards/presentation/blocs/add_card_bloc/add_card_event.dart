part of 'add_card_bloc.dart';

abstract class AddCardEvent extends Equatable {
  const AddCardEvent();

  @override
  List<Object?> get props => [];
}

class AddCardRequested extends AddCardEvent {
  const AddCardRequested({
    required this.cardCode,
    required this.serialNumber,
    this.expiryMonth,
    this.expiryYear,
    required this.category,
    required this.region,
    required this.value,
    required this.uid,
  });

  final String cardCode;
  final CardCategoryEntity category;
  final String serialNumber;
  final int? expiryMonth;
  final int? expiryYear;
  final RegionEntity region;
  final CardValueEntity value;
  final String uid;

  @override
  List<Object?> get props => [
    expiryMonth,
    expiryYear,
    cardCode,
    category,
    region,
    value,
    uid,
  ];
}

class NoExpiryChanged extends AddCardEvent {
  final bool noExpiry;
  const NoExpiryChanged({required this.noExpiry});

  @override
  List<Object?> get props => [noExpiry];
}

class AddCardResetRequested extends AddCardEvent {
  final bool noExpiryDefault;
  const AddCardResetRequested({this.noExpiryDefault = false});

  @override
  List<Object?> get props => [noExpiryDefault];
}
