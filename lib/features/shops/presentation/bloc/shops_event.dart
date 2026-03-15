part of 'shops_bloc.dart';

abstract class ShopsEvent extends Equatable {
  const ShopsEvent();

  @override
  List<Object?> get props => [];
}

class FetchShopsRequested extends ShopsEvent {
  const FetchShopsRequested();
}

class RefreshShopsRequested extends ShopsEvent {
  const RefreshShopsRequested();
}

class ShopsSearchChanged extends ShopsEvent {
  final String query;
  const ShopsSearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}
