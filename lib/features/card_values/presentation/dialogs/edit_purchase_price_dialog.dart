import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/user_role_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/utils/money.dart';
import 'package:base_cards/core/widgets/custom_button.dart';
import 'package:base_cards/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/card_values_bloc.dart';
import '../bloc/card_values_event.dart';
import '../bloc/card_values_state.dart';

Future<void> showEditPurchasePriceDialog({
  required BuildContext context,
  required String categoryId,
  required String regionId,
  required String valueId,
  required int currentPrice,
}) async {
  final t = context.l10n;

  final controller = TextEditingController(
    text: Money.toMajor(currentPrice).toString(),
  );
  final formKey = GlobalKey<FormState>();

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return BlocProvider.value(
        value: context.read<CardValuesBloc>(),
        child: BlocConsumer<CardValuesBloc, CardValuesState>(
          listenWhen:
              (_, state) =>
                  state is PurchasePriceUpdated ||
                  state is PurchasePriceUpdateError,
          listener: (context, state) {
            if (state is PurchasePriceUpdated) {
              Navigator.of(dialogContext).pop();
            } else if (state is PurchasePriceUpdateError) {
              ScaffoldMessenger.of(
                dialogContext,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          buildWhen:
              (_, state) =>
                  state is PurchasePriceUpdating ||
                  state is PurchasePriceUpdated ||
                  state is PurchasePriceUpdateError ||
                  state is CardValuesLoaded ||
                  state is CardValuesLoading ||
                  state is CardValuesError,
          builder: (context, state) {
            final loading = state is PurchasePriceUpdating;

            void submit() async {
              if (loading) return;
              if (!formKey.currentState!.validate()) return;

              final newMajor = double.parse(controller.text.trim());
              final newMinor = Money.toMinor(newMajor);

              context.read<CardValuesBloc>().add(
                UpdatePurchasePriceEvent(
                  categoryId: categoryId,
                  regionId: regionId,
                  valueId: valueId,
                  purchasePrice: newMinor,
                  isSupplier: context.isSupplier,
                ),
              );
            }

            return AlertDialog(
              backgroundColor: AppColors.black,
              title: Text(
                t.purchasePrice,
                style: const TextStyle(color: AppColors.white),
              ),
              content: Form(
                key: formKey,
                child: CustomTextField(
                  textEditingController: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.white.withValues(alpha: .2),
                    ),
                  ),

                  validator: (v) {
                    final text = (v ?? '').trim();
                    if (text.isEmpty) return t.required;

                    final parsed = double.tryParse(text);
                    if (parsed == null) return t.invalidValue;
                    if (parsed < 0) return t.mustBeGreaterThanZero;

                    return null;
                  },
                  onFieldSubmitted: (_) => submit(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed:
                      loading ? null : () => Navigator.of(dialogContext).pop(),
                  child: Text(
                    t.cancel,
                    style: context.medium16(
                      color: AppColors.white.withValues(alpha: .8),
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: loading ? null : submit,
                  width: 100,
                  height: 35,
                  isLoading: loading,
                  backgroundColor: AppColors.white,
                  textColor: AppColors.navy,
                  text: t.save,
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
