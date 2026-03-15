part of 'purchase_bloc.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object?> get props => [];
}

final class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseLoaded extends PurchaseState {
  final List<PurchaseEntity> purchases;

  const PurchaseLoaded(this.purchases);

  @override
  List<Object?> get props => [purchases];
}

class PurchaseError extends PurchaseState {
  final String message;

  const PurchaseError(this.message);

  @override
  List<Object?> get props => [message];
}
