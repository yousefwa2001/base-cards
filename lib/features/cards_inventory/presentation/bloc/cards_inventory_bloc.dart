import 'package:bloc/bloc.dart';
import 'package:base_cards/features/card_values/domain/entities/card_value_entity.dart';
import 'package:base_cards/features/home/domain/entities/card_category_entity.dart';
import 'package:base_cards/features/region/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../cards/domain/entities/card_entity.dart';
import '../../data/datasources/cards_inventory_remote_data_source.dart';
import '../../domain/usecases/cards_inventory_usecase.dart';

part 'cards_inventory_event.dart';
part 'cards_inventory_state.dart';

class CardsInventoryBloc
    extends Bloc<CardsInventoryEvent, CardsInventoryState> {
  final CardsInventoryUseCase getCardsInventoryUseCase;

  CardsInventoryBloc({required this.getCardsInventoryUseCase})
    : super(const CardsInventoryInitial(status: InventoryStatus.all)) {
    on<CardsInventoryFetchRequested>(_onFetch);

    on<InventoryCategoryChanged>(_onCategoryChanged);
    on<InventoryRegionChanged>(_onRegionChanged);
    on<InventoryValueChanged>(_onValueChanged);
    on<InventoryStatusChanged>(_onStatusChanged);

    on<InventoryResetCategory>(_onResetCategory);
    on<InventoryResetRegion>(_onResetRegion);
    on<InventoryResetValue>(_onResetValue);
    on<InventoryResetAllFilters>(_onResetAll);
  }

  Future<void> _onFetch(
    CardsInventoryFetchRequested event,
    Emitter<CardsInventoryState> emit,
  ) async {
    final category = event.category ?? state.category;
    final region = event.region ?? state.region;
    final value = event.value ?? state.value;
    final status = event.status;

    emit(
      CardsInventoryLoading(
        category: category,
        region: region,
        value: value,
        status: status,
      ),
    );

    try {
      final result = await getCardsInventoryUseCase(
        categoryId: category?.id,
        regionId: region?.id,
        valueId: value?.id,
        status: status,
      );

      result.fold(
        (failure) => emit(
          CardsInventoryError(
            message: failure.message,

            category: category,
            region: region,
            value: value,
            status: status,
          ),
        ),
        (cards) {
          if (cards.isEmpty) {
            emit(
              CardsInventoryEmpty(
                category: category,
                region: region,
                value: value,
                status: status,
              ),
            );
          } else {
            emit(
              CardsInventorySuccess(
                cards: cards,
                category: category,
                region: region,
                value: value,
                status: status,
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(
        CardsInventoryError(
          message: e.toString(),
          category: category,
          region: region,
          value: value,
          status: status,
        ),
      );
    }
  }

  void _fetchWithCurrent() {
    add(CardsInventoryFetchRequested(status: state.status));
  }

  void _onCategoryChanged(
    InventoryCategoryChanged event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      CardsInventoryInitial(
        category: event.category,
        region: null,
        value: null,
        status: state.status,
      ),
    );
    _fetchWithCurrent();
  }

  void _onRegionChanged(
    InventoryRegionChanged event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      CardsInventoryInitial(
        category: state.category,
        region: event.region,
        value: null,
        status: state.status,
      ),
    );
    _fetchWithCurrent();
  }

  void _onValueChanged(
    InventoryValueChanged event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      CardsInventoryInitial(
        category: state.category,
        region: state.region,
        value: event.value,
        status: state.status,
      ),
    );
    _fetchWithCurrent();
  }

  void _onStatusChanged(
    InventoryStatusChanged event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      CardsInventoryInitial(
        category: state.category,
        region: state.region,
        value: state.value,
        status: event.status,
      ),
    );
    _fetchWithCurrent();
  }

  void _onResetCategory(
    InventoryResetCategory event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      CardsInventoryInitial(
        category: null,
        region: null,
        value: null,
        status: state.status,
      ),
    );
    _fetchWithCurrent();
  }

  void _onResetRegion(
    InventoryResetRegion event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      CardsInventoryInitial(
        category: state.category,
        region: null,
        value: null,
        status: state.status,
      ),
    );
    _fetchWithCurrent();
  }

  void _onResetValue(
    InventoryResetValue event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      CardsInventoryInitial(
        category: state.category,
        region: state.region,
        value: null,
        status: state.status,
      ),
    );
    _fetchWithCurrent();
  }

  void _onResetAll(
    InventoryResetAllFilters event,
    Emitter<CardsInventoryState> emit,
  ) {
    emit(
      const CardsInventoryInitial(
        category: null,
        region: null,
        value: null,
        status: InventoryStatus.all,
      ),
    );
    _fetchWithCurrent();
  }
}
