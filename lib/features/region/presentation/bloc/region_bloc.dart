import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/region_entity.dart';
import '../../domain/use_cases/region_use_case.dart';

part 'region_event.dart';
part 'region_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  RegionUseCase getRegionsUseCase;
  RegionBloc({required this.getRegionsUseCase}) : super(RegionInitial()) {
    on<LoadRegionsEvent>(_onLoadRegionsEvent);
  }
  Future<void> _onLoadRegionsEvent(
    LoadRegionsEvent event,
    Emitter<RegionState> emit,
  ) async {
    emit(RegionLoading());
    try {
      final regions = await getRegionsUseCase(
        categoryId: event.categoryId,
        isSupplier: await event.isSupplier,
      );
      regions.fold(
        (failure) => emit(RegionError(failure.message)),
        (regions) => emit(RegionLoaded(regions)),
      );
    } catch (e) {
      emit(RegionError(e.toString()));
    }
  }
}
