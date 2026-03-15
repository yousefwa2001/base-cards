part of 'cards_inventory_bloc.dart';

abstract class CardsInventoryEvent extends Equatable {
  const CardsInventoryEvent();

  @override
  List<Object?> get props => [];
}

class CardsInventoryFetchRequested extends CardsInventoryEvent {
  const CardsInventoryFetchRequested({
    this.category,
    this.region,
    this.value,
    required this.status,
  });

  final CardCategoryEntity? category;
  final RegionEntity? region;
  final CardValueEntity? value;
  final InventoryStatus status;

  @override
  List<Object?> get props => [category, region, value, status];
}

class CardsInventoryRefreshRequested extends CardsInventoryEvent {
  const CardsInventoryRefreshRequested();
}

class CardsInventoryCleared extends CardsInventoryEvent {
  const CardsInventoryCleared();
}

// ===== SET FILTER EVENTS =====

class InventoryCategoryChanged extends CardsInventoryEvent {
  final CardCategoryEntity? category;
  const InventoryCategoryChanged(this.category);

  @override
  List<Object?> get props => [category];
}

class InventoryRegionChanged extends CardsInventoryEvent {
  final RegionEntity? region;
  const InventoryRegionChanged(this.region);

  @override
  List<Object?> get props => [region];
}

class InventoryValueChanged extends CardsInventoryEvent {
  final CardValueEntity? value;
  const InventoryValueChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class InventoryStatusChanged extends CardsInventoryEvent {
  final InventoryStatus status;
  const InventoryStatusChanged({required this.status});

  @override
  List<Object?> get props => [status];
}

// ===== RESET EVENTS =====

class InventoryResetCategory extends CardsInventoryEvent {
  const InventoryResetCategory();
}

class InventoryResetRegion extends CardsInventoryEvent {
  const InventoryResetRegion();
}

class InventoryResetValue extends CardsInventoryEvent {
  const InventoryResetValue();
}

class InventoryResetAllFilters extends CardsInventoryEvent {
  const InventoryResetAllFilters();
}
