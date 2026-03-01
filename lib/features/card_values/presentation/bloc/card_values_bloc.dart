import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/card_values_usecase.dart';
import '../../domain/usecases/update_purchase_price_usecase.dart';

import 'card_values_event.dart';
import 'card_values_state.dart';

class CardValuesBloc extends Bloc<CardValuesEvent, CardValuesState> {
  final CardValuesUseCase getValuesUseCase;
  final UpdatePurchasePriceUseCase updatePurchasePriceUseCase;

  CardValuesBloc({
    required this.getValuesUseCase,
    required this.updatePurchasePriceUseCase,
  }) : super(CardValuesInitial()) {
    on<LoadCardValuesEvent>(_onLoadCardValuesEvent);
    on<UpdatePurchasePriceEvent>(_onUpdatePurchasePriceEvent);
  }

  Future<void> _onLoadCardValuesEvent(
    LoadCardValuesEvent event,
    Emitter<CardValuesState> emit,
  ) async {
    emit(CardValuesLoading());
    try {
      final values = await getValuesUseCase(
        categoryId: event.categoryId,
        regionId: event.regionId,
        isSupplier: await event.isSupplier,
      );
      values.fold(
        (failure) => emit(CardValuesError(failure.message)),
        (values) => emit(CardValuesLoaded(values)),
      );
    } catch (e) {
      emit(CardValuesError(e.toString()));
    }
  }

  Future<void> _onUpdatePurchasePriceEvent(
    UpdatePurchasePriceEvent event,
    Emitter<CardValuesState> emit,
  ) async {
    emit(PurchasePriceUpdating());

    final result = await updatePurchasePriceUseCase(
      categoryId: event.categoryId,
      regionId: event.regionId,
      valueId: event.valueId,
      purchasePrice: event.purchasePrice,
    );

    result.fold(
      (failure) => emit(PurchasePriceUpdateError(message: failure.message)),
      (_) {
        emit(PurchasePriceUpdated());

        add(
          LoadCardValuesEvent(
            categoryId: event.categoryId,
            regionId: event.regionId,
            isSupplier: event.isSupplier,
          ),
        );
      },
    );
  }
}
