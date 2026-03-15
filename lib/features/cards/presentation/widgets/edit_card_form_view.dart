import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/context_padding_extension.dart';
import '../../../../../core/extensions/context_typography_extension.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../l10n/generated/app_localizations.dart';
import '../blocs/edit_card_bloc/edit_card_bloc.dart';

import 'edit_card_loading_section.dart';
import 'expiry_dropdowns.dart';

class EditCardFormView extends StatelessWidget {
  final BuildContext dialogContext;
  final AppLocalizations t;
  final bool isLoading;
  final String? errorText;

  final String cardId;
  final bool showExpiry;

  final TextEditingController codeController;
  final TextEditingController serialNumberController;
  final TextEditingController expiryMonthController;
  final TextEditingController expiryYearController;

  const EditCardFormView({
    super.key,
    required this.dialogContext,
    required this.t,
    required this.isLoading,
    required this.errorText,
    required this.cardId,
    required this.showExpiry,
    required this.codeController,
    required this.serialNumberController,
    required this.expiryMonthController,
    required this.expiryYearController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          t.editCardCodeTitle,
          style: dialogContext.bold14(color: AppColors.black),
        ),
        SizedBox(height: 8.h),
        Text(
          t.editCardCodeSubtitle,
          style: dialogContext.semiBold12(color: AppColors.secondary),
        ),
        SizedBox(height: 14.h),

        CustomTextField(
          label: t.cardCode,
          textEditingController: codeController,
          fillColor: AppColors.whiteOut,
          filled: true,
          textStyle: dialogContext.medium14(color: AppColors.black),
          isReadOnly: isLoading,
          errorText: errorText,
          hintText: t.enterNewCode,
        ),
        SizedBox(height: 15.h),

        if (showExpiry)
          ExpiryDropdowns(
            selectedMonth: int.tryParse(expiryMonthController.text),
            textColor: AppColors.black,
            selectedYear: int.tryParse(expiryYearController.text),
            onMonthChanged: (m) => expiryMonthController.text = m.toString(),
            onYearChanged: (y) => expiryYearController.text = y.toString(),
          ),

        CustomTextField(
          label: t.serial_number,
          textEditingController: serialNumberController,
          fillColor: AppColors.whiteOut,
          filled: true,
          textStyle: dialogContext.medium14(color: AppColors.black),
          isReadOnly: isLoading,
          errorText: errorText,
          hintText: t.serial_number,
        ),
        SizedBox(height: 10.h),

        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed:
                    isLoading
                        ? null
                        : () async {
                          await Clipboard.setData(
                            ClipboardData(text: codeController.text),
                          );
                          if (!dialogContext.mounted) return;

                          ScaffoldMessenger.of(dialogContext).showSnackBar(
                            SnackBar(
                              content: Text(t.codeCopied),
                              behavior: SnackBarBehavior.floating,
                              margin: dialogContext.paddingAll(12),
                            ),
                          );
                        },
                backgroundColor: AppColors.whiteOut,
                textColor: AppColors.black,
                text: t.copyCode,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: CustomButton(
                onPressed:
                    isLoading
                        ? null
                        : () {
                          context.read<EditCardBloc>().add(
                            EditCardCodeRequested(
                              cardId: cardId,
                              newCode: codeController.text,
                              serialNumber: serialNumberController.text,
                              expiryMonth: int.tryParse(
                                expiryMonthController.text,
                              ),
                              expiryYear: int.tryParse(
                                expiryYearController.text,
                              ),
                            ),
                          );
                        },
                backgroundColor: AppColors.black,
                textColor: AppColors.white,
                text: t.save,
              ),
            ),
          ],
        ),

        SizedBox(height: 10.h),

        CustomButton(
          onPressed: isLoading ? null : () => Navigator.of(dialogContext).pop(),
          backgroundColor: AppColors.whiteOut,
          textColor: AppColors.secondary,
          text: t.cancel,
        ),

        if (isLoading)
          EditCardLoadingSection(
            dialogContext: dialogContext,
            savingText: t.savingChanges,
          ),
      ],
    );
  }
}
