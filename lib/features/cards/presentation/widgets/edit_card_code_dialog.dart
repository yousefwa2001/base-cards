import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/di/locator.dart';
import '../../../../core/constants/app_exception.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/utils/logger.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../blocs/edit_card_bloc/edit_card_bloc.dart';
import 'edit_card_form_view.dart';
import 'edit_card_success_view.dart';
import 'edit_code_header.dart';

class EditCardCodeDialog extends StatefulWidget {
  final String cardId;
  final String currentCode;
  final String currentSerialNumber;
  final int? currentExpiryMonth;
  final int? currentExpiryYear;

  const EditCardCodeDialog({
    super.key,
    required this.cardId,
    required this.currentCode,
    required this.currentExpiryMonth,
    required this.currentSerialNumber,
    required this.currentExpiryYear,
  });

  @override
  State<EditCardCodeDialog> createState() => _EditCardCodeDialogState();
}

class _EditCardCodeDialogState extends State<EditCardCodeDialog> {
  late final TextEditingController codeController;
  late final TextEditingController serialNumberController;
  late final TextEditingController expiryMonthController;
  late final TextEditingController expiryYearController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController(text: widget.currentCode);
    serialNumberController = TextEditingController(
      text: widget.currentSerialNumber,
    );
    expiryMonthController = TextEditingController(
      text: widget.currentExpiryMonth.toString(),
    );
    expiryYearController = TextEditingController(
      text: widget.currentExpiryYear.toString(),
    );
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    codeController.dispose();
    serialNumberController.dispose();
    expiryMonthController.dispose();
    expiryYearController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext dialogContext) {
    final t = dialogContext.l10n;

    return PopScope(
      canPop: true,
      child: BlocProvider<EditCardBloc>(
        create: (_) => getIt<EditCardBloc>(),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Padding(
            padding: dialogContext.paddingAll(18),
            child: BlocConsumer<EditCardBloc, EditCardState>(
              listener: (ctx, state) {
                if (state is EditCardSuccess) {
                  if (focusNode.hasFocus) focusNode.unfocus();
                }
              },
              builder: (ctx, state) {
                final isLoading = state is EditCardLoading;

                String? errorText;
                if (state is EditCardError) {
                  errorText = _mapEditErrorToMessage(
                    t: t,
                    exception: state.code,
                  );
                  AppLogger.error(state.code);
                }

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      EditCodeHeader(isLoading: isLoading),
                      SizedBox(height: 12.h),

                      if (state is EditCardSuccess)
                        EditCardSuccessView(dialogContext: dialogContext)
                      else
                        EditCardFormView(
                          dialogContext: dialogContext,
                          t: t,
                          isLoading: isLoading,
                          errorText: errorText,
                          cardId: widget.cardId,
                          showExpiry: widget.currentExpiryMonth != null,
                          codeController: codeController,
                          serialNumberController: serialNumberController,
                          expiryMonthController: expiryMonthController,
                          expiryYearController: expiryYearController,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String _mapEditErrorToMessage({
    required String exception,
    required AppLocalizations t,
  }) {
    if (exception.contains(AppException.codeAlreadyExists)) {
      return t.cardCodeAlreadyExists;
    }

    return t.errAlreadySold;
  }
}
