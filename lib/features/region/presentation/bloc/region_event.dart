part of 'region_bloc.dart';

sealed class RegionEvent extends Equatable {
  const RegionEvent();

  @override
  List<Object> get props => [];
}

class LoadRegionsEvent extends RegionEvent {
  final String categoryId;
  final Future<bool> isSupplier;

  const LoadRegionsEvent({required this.categoryId, required this.isSupplier});

  @override
  List<Object> get props => [categoryId, isSupplier];
}
