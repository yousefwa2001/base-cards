part of 'adjust_balance_bloc.dart';

abstract class AdjustBalanceState extends Equatable {
  final BalanceDirection direction;
  const AdjustBalanceState({required this.direction});

  @override
  List<Object?> get props => [direction];
}

class AdjustBalanceInitial extends AdjustBalanceState {
  const AdjustBalanceInitial({required super.direction});

  @override
  List<Object?> get props => [direction];
}

class AdjustBalanceLoading extends AdjustBalanceState {
  const AdjustBalanceLoading({required super.direction});

  @override
  List<Object?> get props => [direction];
}

class AdjustBalanceSuccess extends AdjustBalanceState {
  final String txId;
  const AdjustBalanceSuccess({required this.txId, required super.direction});

  @override
  List<Object?> get props => [txId, direction];
}

class AdjustBalanceError extends AdjustBalanceState {
  final String message;
  const AdjustBalanceError({required this.message, required super.direction});

  @override
  List<Object?> get props => [message, direction];
}
