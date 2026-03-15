import 'package:bloc/bloc.dart';
import 'package:base_cards/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/fetch_shops_use_case.dart';

part 'shops_event.dart';
part 'shops_state.dart';

class ShopsBloc extends Bloc<ShopsEvent, ShopsState> {
  final FetchShopsUseCase fetchShopsUseCase;

  ShopsBloc({required this.fetchShopsUseCase})
    : super(const ShopsInitial(shops: [])) {
    on<FetchShopsRequested>(_onFetchShopsRequested);
    on<RefreshShopsRequested>(_onRefreshShopsRequested);
    on<ShopsSearchChanged>((event, emit) {
      final q = event.query.trim().toLowerCase();

      emit(ShopsSuccess(shops: state.shops, query: q));
    });
  }

  Future<void> _onFetchShopsRequested(
    FetchShopsRequested event,
    Emitter<ShopsState> emit,
  ) async {
    emit(ShopsLoading(shops: state.shops));

    final result = await fetchShopsUseCase();

    result.fold(
      (failure) => emit(
        ShopsFailure(
          message: _mapFailureToMessage(failure),
          shops: state.shops,
        ),
      ),
      (shops) => emit(ShopsSuccess(shops: shops)),
    );
  }

  Future<void> _onRefreshShopsRequested(
    RefreshShopsRequested event,
    Emitter<ShopsState> emit,
  ) async {
    final current = state;
    if (current is ShopsSuccess) {
      final result = await fetchShopsUseCase();
      result.fold(
        (failure) => emit(
          ShopsFailure(
            message: _mapFailureToMessage(failure),
            shops: state.shops,
          ),
        ),
        (shops) => emit(ShopsSuccess(shops: shops)),
      );
      return;
    }

    add(const FetchShopsRequested());
  }

  String _mapFailureToMessage(dynamic failure) {
    // If your Failure has message fields, adjust this mapping.
    return failure.toString();
  }
}
