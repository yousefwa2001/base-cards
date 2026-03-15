part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactionsEvent extends TransactionsEvent {
  final String shopId;

  const LoadTransactionsEvent({required this.shopId});

  @override
  List<Object> get props => [shopId];
}
