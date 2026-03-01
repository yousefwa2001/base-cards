import 'package:bloc/bloc.dart';
import 'package:base_cards/core/enums/balance_direction.dart';
import 'package:base_cards/core/utils/logger.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/adjust_balance_usecase.dart';

part 'adjust_balance_event.dart';
part 'adjust_balance_state.dart';

class AdjustBalanceBloc extends Bloc<AdjustBalanceEvent, AdjustBalanceState> {
  final AdjustShopBalanceUseCase useCase;

  AdjustBalanceBloc({required this.useCase})
    : super(const AdjustBalanceInitial(direction: BalanceDirection.credit)) {
    on<AdjustBalanceRequested>(_onAdjustBalanceRequested);
    on<EditBalanceDirection>(_onEditBalanceDirection);
  }

  Future<void> _onAdjustBalanceRequested(
    AdjustBalanceRequested event,
    Emitter<AdjustBalanceState> emit,
  ) async {
    emit(AdjustBalanceLoading(direction: state.direction));

    final result = await useCase(
      shopId: event.shopId,
      amount: event.amount,
      direction: event.direction,
      note: event.note,
    );

    result.fold(
      (failure) => emit(
        AdjustBalanceError(
          message: failure.message,
          direction: state.direction,
        ),
      ),
      (txId) {
        AppLogger.warn('dddssd');
        emit(AdjustBalanceSuccess(txId: txId, direction: state.direction));
      },
    );
  }

  Future<void> _onEditBalanceDirection(
    EditBalanceDirection event,
    Emitter<AdjustBalanceState> emit,
  ) async {
    final newDirection = event.direction;

    if (state is AdjustBalanceLoading) {
      emit(AdjustBalanceLoading(direction: newDirection));
      return;
    }

    if (state is AdjustBalanceSuccess) {
      final s = state as AdjustBalanceSuccess;
      emit(AdjustBalanceSuccess(txId: s.txId, direction: newDirection));
      return;
    }

    if (state is AdjustBalanceError) {
      final s = state as AdjustBalanceError;
      emit(AdjustBalanceError(message: s.message, direction: newDirection));
      return;
    }

    emit(AdjustBalanceInitial(direction: newDirection));
  }
}
