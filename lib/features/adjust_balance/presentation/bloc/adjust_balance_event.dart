part of 'adjust_balance_bloc.dart';

abstract class AdjustBalanceEvent extends Equatable {
  const AdjustBalanceEvent();

  @override
  List<Object?> get props => [];
}

class AdjustBalanceRequested extends AdjustBalanceEvent {
  final String shopId;
  final int amount;
  final String direction;
  final String? note;

  const AdjustBalanceRequested({
    required this.shopId,
    required this.amount,
    required this.direction,
    this.note,
  });

  @override
  List<Object?> get props => [shopId, amount, direction, note];
}

class EditBalanceDirection extends AdjustBalanceEvent {
  final BalanceDirection direction;
  const EditBalanceDirection({required this.direction});
  @override
  List<Object?> get props => [direction];
}
