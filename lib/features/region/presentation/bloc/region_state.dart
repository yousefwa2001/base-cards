part of 'region_bloc.dart';

sealed class RegionState extends Equatable {
  const RegionState();

  @override
  List<Object?> get props => [];
}

final class RegionInitial extends RegionState {}

class RegionLoading extends RegionState {}

class RegionLoaded extends RegionState {
  final List<RegionEntity> regions;

  const RegionLoaded(this.regions);

  @override
  List<Object?> get props => [regions];
}

class RegionError extends RegionState {
  final String message;

  const RegionError(this.message);

  @override
  List<Object?> get props => [message];
}
