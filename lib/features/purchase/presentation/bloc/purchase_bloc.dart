import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/purchase_entity.dart';
import '../../domain/usecases/purchase_use_case.dart';

part 'purchase_event.dart';
part 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final PurchaseUseCase getPurchasesUseCase;
  PurchaseBloc({required this.getPurchasesUseCase}) : super(PurchaseInitial()) {
    on<PurchaseEvent>((event, emit) {});
    on<LoadPurchasesEvent>(_onLoadPurchasesEvent);
  }
  Future<void> _onLoadPurchasesEvent(
    LoadPurchasesEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      final purchases = await getPurchasesUseCase(buyerId: event.buyerId);
      purchases.fold(
        (failure) => emit(PurchaseError(failure.message)),
        (purchases) => emit(PurchaseLoaded(purchases)),
      );
    } catch (e) {
      emit(PurchaseError(e.toString()));
    }
  }
}
