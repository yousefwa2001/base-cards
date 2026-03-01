part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class CardCategoriesInitial extends HomeState {}

class CategoriesLoading extends HomeState {}

class CategoriesLoaded extends HomeState {
  final List<CardCategoryEntity> categories;

  const CategoriesLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class CategoriesError extends HomeState {
  final String message;

  const CategoriesError({required this.message});

  @override
  List<Object?> get props => [message];
}
