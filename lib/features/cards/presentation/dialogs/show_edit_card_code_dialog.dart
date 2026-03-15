import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cards_inventory/presentation/bloc/cards_inventory_bloc.dart';
import '../widgets/edit_card_code_dialog.dart';

Future<void> showEditCardCodeDialog({
  required BuildContext context,
  required CardsInventoryBloc inventoryBloc,

  required String cardId,
  required String currentCode,
  required String currentSerialNumber,
  required int? currentExpiryMonth,
  required int? currentExpiryYear,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    useRootNavigator: false,
    builder: (_) {
      return BlocProvider.value(
        value: inventoryBloc,
        child: EditCardCodeDialog(
          cardId: cardId,
          currentCode: currentCode,
          currentSerialNumber: currentSerialNumber,
          currentExpiryMonth: currentExpiryMonth,
          currentExpiryYear: currentExpiryYear,
        ),
      );
    },
  );
}
