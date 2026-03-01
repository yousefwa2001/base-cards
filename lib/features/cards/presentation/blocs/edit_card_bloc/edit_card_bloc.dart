import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/edit_card_use_case.dart';

part 'edit_card_event.dart';
part 'edit_card_state.dart';

class EditCardBloc extends Bloc<EditCardEvent, EditCardState> {
  final EditCardUseCase editCardUseCase;

  EditCardBloc({required this.editCardUseCase})
    : super(const EditCardInitial()) {
    on<EditCardCodeRequested>(_onEditCardCodeRequested);
    on<EditCardReset>(_onReset);
  }

  Future<void> _onEditCardCodeRequested(
    EditCardCodeRequested event,
    Emitter<EditCardState> emit,
  ) async {
    final newCode = event.newCode.trim();
    if (newCode.isEmpty) {
      emit(const EditCardError('invalid-code'));
      return;
    }

    emit(const EditCardLoading());

    final result = await editCardUseCase(
      cardId: event.cardId,
      newCode: newCode,
      serialNumber: event.serialNumber,
      expiryYear: event.expiryYear,
      expiryMonth: event.expiryMonth,
    );

    result.fold(
      (f) => emit(EditCardError(f.message)),
      (_) => emit(const EditCardSuccess()),
    );
  }

  void _onReset(EditCardReset event, Emitter<EditCardState> emit) {
    emit(const EditCardInitial());
  }
}
