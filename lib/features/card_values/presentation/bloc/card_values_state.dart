import 'package:equatable/equatable.dart';
import '../../domain/entities/card_value_entity.dart';

abstract class CardValuesState extends Equatable {
  const CardValuesState();

  @override
  List<Object?> get props => [];
}

class CardValuesInitial extends CardValuesState {}

class CardValuesLoading extends CardValuesState {}

class CardValuesLoaded extends CardValuesState {
  final List<CardValueEntity> values;

  const CardValuesLoaded(this.values);

  @override
  List<Object?> get props => [values];
}

class CardValuesError extends CardValuesState {
  final String message;

  const CardValuesError(this.message);

  @override
  List<Object?> get props => [message];
}

class PurchasePriceUpdating extends CardValuesState {}

class PurchasePriceUpdated extends CardValuesState {}

class PurchasePriceUpdateError extends CardValuesState {
  final String message;
  const PurchasePriceUpdateError({required this.message});

  @override
  List<Object> get props => [message];
}
