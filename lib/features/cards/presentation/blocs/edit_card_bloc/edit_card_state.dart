part of 'edit_card_bloc.dart';

sealed class EditCardState extends Equatable {
  const EditCardState();

  @override
  List<Object?> get props => [];
}

class EditCardInitial extends EditCardState {
  const EditCardInitial();
}

class EditCardLoading extends EditCardState {
  const EditCardLoading();
}

class EditCardSuccess extends EditCardState {
  const EditCardSuccess();
}

class EditCardError extends EditCardState {
  final String code;

  const EditCardError(this.code);

  @override
  List<Object?> get props => [code];
}
