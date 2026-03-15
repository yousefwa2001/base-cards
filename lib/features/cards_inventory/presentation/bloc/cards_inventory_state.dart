part of 'cards_inventory_bloc.dart';

abstract class CardsInventoryState extends Equatable {
  final CardCategoryEntity? category;
  final RegionEntity? region;
  final CardValueEntity? value;

  final InventoryStatus status;

  const CardsInventoryState({
    this.category,
    this.region,
    this.value,
    required this.status,
  });

  @override
  List<Object?> get props => [category, region, value, status];
}

class CardsInventoryInitial extends CardsInventoryState {
  const CardsInventoryInitial({
    super.category,
    super.region,
    super.value,
    required super.status,
  });
}

class CardsInventoryLoading extends CardsInventoryState {
  const CardsInventoryLoading({
    super.category,
    super.region,
    super.value,
    required super.status,
  });
}

class CardsInventorySuccess extends CardsInventoryState {
  final List<CardEntity> cards;

  const CardsInventorySuccess({
    required this.cards,
    super.category,
    super.region,
    super.value,
    required super.status,
  });

  @override
  List<Object?> get props => [...super.props, cards];
}

class CardsInventoryEmpty extends CardsInventoryState {
  const CardsInventoryEmpty({
    super.category,
    super.region,
    super.value,
    required super.status,
  });
}

class CardsInventoryError extends CardsInventoryState {
  final String message;
  final String? code;

  const CardsInventoryError({
    required this.message,
    this.code,
    super.category,
    super.region,
    super.value,
    required super.status,
  });

  @override
  List<Object?> get props => [...super.props, message, code];
}
