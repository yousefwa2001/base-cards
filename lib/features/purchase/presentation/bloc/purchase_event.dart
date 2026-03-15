part of 'purchase_bloc.dart';

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();

  @override
  List<Object> get props => [];
}

class LoadPurchasesEvent extends PurchaseEvent {
  final String buyerId;

  const LoadPurchasesEvent({required this.buyerId});

  @override
  List<Object> get props => [buyerId];
}
