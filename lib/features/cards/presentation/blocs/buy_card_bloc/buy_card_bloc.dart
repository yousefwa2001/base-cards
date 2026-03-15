import 'package:bloc/bloc.dart';
import 'package:base_cards/core/utils/logger.dart';
import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/purchased_card_result.dart';
import '../../../domain/usecases/buy_card_use_case.dart';
part 'buy_card_event.dart';
part 'buy_card_state.dart';

class BuyCardBloc extends Bloc<BuyCardEvent, BuyCardState> {
  final BuyCardUseCase buyCardUseCase;

  BuyCardBloc({required this.buyCardUseCase}) : super(BuyCardInitial()) {
    on<BuyCardRequested>((event, emit) async {
      emit(BuyCardLoading());
      try {
        final result = await buyCardUseCase(
          category: event.category,
          region: event.region,
          value: event.value,
        );

        result.fold((l) {
          AppLogger.error(l.debugMessage);
          emit(BuyCardError(l.message));
        }, (r) => emit(BuyCardSuccess(card: r)));
      } catch (e) {
        emit(BuyCardError(e.toString()));
      }
    });
  }
}
