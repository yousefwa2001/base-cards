import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/card_category_entity.dart';
import '../../../domain/usecases/get_all_categories_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllCategoriesUseCase getAllCategories;
  HomeBloc({required this.getAllCategories}) : super(HomeInitial()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
  }
  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(CategoriesLoading());
    try {
      final categories = await getAllCategories(
        isSupplier: await event.isSupplier,
      );
      categories.fold(
        (failure) => emit(CategoriesError(message: failure.message)),
        (categories) => emit(CategoriesLoaded(categories: categories)),
      );
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }
}
