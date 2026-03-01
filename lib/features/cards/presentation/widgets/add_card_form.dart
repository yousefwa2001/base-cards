import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../blocs/add_card_bloc/add_card_bloc.dart';
import 'expiry_dropdowns.dart';

class AddCardForm extends StatelessWidget {
  final TextEditingController cardCodeController;
  final TextEditingController serialNumberController;
  final TextEditingController expiryMonthController;
  final TextEditingController expiryYearController;
  final GlobalKey<FormState> formKey;
  const AddCardForm({
    super.key,
    required this.cardCodeController,
    required this.serialNumberController,
    required this.expiryMonthController,
    required this.expiryYearController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            textEditingController: cardCodeController,
            label: t.cardCode,
            hintText: t.cardCode,
            validator: (card) {
              if (card == null || card.isEmpty) {
                return t.cardCodeEmpty;
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          BlocBuilder<AddCardBloc, AddCardState>(
            builder: (context, state) {
              return ExpiryDropdowns(
                selectedMonth: int.tryParse(expiryMonthController.text),
                noExpiry: state.noExpiry,
                onNoExpiryChanged: () {
                  expiryMonthController.clear();
                  expiryYearController.clear();
                  context.read<AddCardBloc>().add(
                    NoExpiryChanged(noExpiry: !state.noExpiry),
                  );
                },
                selectedYear: int.tryParse(expiryYearController.text),
                onMonthChanged:
                    (m) => expiryMonthController.text = m.toString(),
                onYearChanged: (y) => expiryYearController.text = y.toString(),
                showNoExpiry: true,
              );
            },
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            textEditingController: serialNumberController,
            label: t.serial_number,
            hintText: t.serial_number,
            validator: (serialNumber) {
              if (serialNumber == null || serialNumber.isEmpty) {
                return t.serial_number;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
