part of 'balance_cubit.dart';

sealed class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object> get props => [];
}

class BalanceInitial extends BalanceState {
  const BalanceInitial();
}

class BalanceLoading extends BalanceState {
  const BalanceLoading();
}

class BalanceLoaded extends BalanceState {
  final int balance;
  const BalanceLoaded(this.balance);
  @override
  List<Object> get props => [balance];
}

class BalanceError extends BalanceState {
  final String message;
  const BalanceError(this.message);
}
