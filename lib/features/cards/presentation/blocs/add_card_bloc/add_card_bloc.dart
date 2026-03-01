import 'package:bloc/bloc.dart';
import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/add_card_usecase.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  final AddCardUseCase addCardUseCase;
  AddCardBloc({required this.addCardUseCase}) : super(const AddCardInitial()) {
    on<NoExpiryChanged>((event, emit) {
      final current = state;

      if (current is AddCardLoading) {
        emit(AddCardLoading(noExpiry: event.noExpiry));
      } else if (current is AddCardSuccess) {
        emit(AddCardSuccess(noExpiry: event.noExpiry));
      } else if (current is AddCardError) {
        emit(AddCardError(noExpiry: event.noExpiry, message: current.message));
      } else {
        emit(AddCardInitial(noExpiry: event.noExpiry));
      }
    });

    on<AddCardResetRequested>((event, emit) {
      emit(AddCardInitial(noExpiry: event.noExpiryDefault));
    });

    on<AddCardRequested>((event, emit) async {
      try {
        emit(const AddCardLoading());
        final addCard = await addCardUseCase(
          cardCode: event.cardCode,
          category: event.category,
          serialNumber: event.serialNumber,
          expiryMonth: event.expiryMonth,
          expiryYear: event.expiryYear,
          value: event.value,
          region: event.region,
          uid: event.uid,
        );
        addCard.fold((l) {
          emit(AddCardError(message: l.message));
        }, (r) => emit(const AddCardSuccess()));
      } catch (e) {
        emit(AddCardError(message: e.toString()));
      } finally {
        emit(const AddCardInitial());
      }
    });
  }
}
