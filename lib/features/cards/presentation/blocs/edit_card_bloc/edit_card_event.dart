part of 'edit_card_bloc.dart';

sealed class EditCardEvent extends Equatable {
  const EditCardEvent();

  @override
  List<Object?> get props => [];
}

class EditCardCodeRequested extends EditCardEvent {
  final String cardId;
  final String newCode;
  final String serialNumber;
  final int? expiryYear;
  final int? expiryMonth;

  const EditCardCodeRequested({
    required this.cardId,
    required this.newCode,
    required this.serialNumber,
    required this.expiryYear,
    required this.expiryMonth,
  });

  @override
  List<Object?> get props => [
    cardId,
    newCode,
    serialNumber,
    expiryYear,
    expiryMonth,
  ];
}

class EditCardReset extends EditCardEvent {
  const EditCardReset();
}
