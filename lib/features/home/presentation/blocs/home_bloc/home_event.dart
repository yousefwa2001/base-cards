part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoriesEvent extends HomeEvent {
  final Future<bool> isSupplier;
  const LoadCategoriesEvent({required this.isSupplier});
  @override
  List<Object> get props => [isSupplier];
}
