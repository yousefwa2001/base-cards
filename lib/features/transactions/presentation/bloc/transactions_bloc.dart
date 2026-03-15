import 'package:base_cards/features/adjust_balance/domain/entities/balance_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/transactions_use_case.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsUseCase getTransactionsUseCase;
  TransactionsBloc({required this.getTransactionsUseCase})
    : super(TransactionsInitial()) {
    on<TransactionsEvent>((event, emit) {});
    on<LoadTransactionsEvent>(_onLoadTransactionsEvent);
  }
  Future<void> _onLoadTransactionsEvent(
    LoadTransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(TransactionsLoading());
    try {
      final transactionss = await getTransactionsUseCase(shopId: event.shopId);
      transactionss.fold(
        (failure) => emit(TransactionsError(failure.message)),
        (transactionss) => emit(TransactionsLoaded(transactionss)),
      );
    } catch (e) {
      emit(TransactionsError(e.toString()));
    }
  }
}
