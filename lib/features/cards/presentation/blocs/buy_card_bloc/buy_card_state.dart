part of 'buy_card_bloc.dart';

abstract class BuyCardState extends Equatable {
  const BuyCardState();
  @override
  List<Object?> get props => [];
}

class BuyCardInitial extends BuyCardState {}

class BuyCardLoading extends BuyCardState {}

class BuyCardSuccess extends BuyCardState {
  const BuyCardSuccess({required this.card});
  final PurchasedCardResult card;

  @override
  List<Object?> get props => [card];
}

class BuyCardError extends BuyCardState {
  const BuyCardError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
