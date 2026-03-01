part of 'add_card_bloc.dart';

abstract class AddCardState extends Equatable {
  final bool noExpiry;

  const AddCardState({this.noExpiry = false});

  @override
  List<Object?> get props => [noExpiry];
}

class AddCardInitial extends AddCardState {
  const AddCardInitial({super.noExpiry});
}

class AddCardLoading extends AddCardState {
  const AddCardLoading({super.noExpiry});
}

class AddCardSuccess extends AddCardState {
  const AddCardSuccess({super.noExpiry});
}

class AddCardError extends AddCardState {
  final String message;

  const AddCardError({super.noExpiry, required this.message});

  @override
  List<Object?> get props => [noExpiry, message];
}
