import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/l10n_extension.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../cards_inventory/presentation/bloc/cards_inventory_bloc.dart';
import 'success_pill.dart';

class EditCardSuccessView extends StatelessWidget {
  final BuildContext dialogContext;

  const EditCardSuccessView({super.key, required this.dialogContext});

  @override
  Widget build(BuildContext context) {
    final t = dialogContext.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SuccessPill(text: t.savedSuccessfully),
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  context.read<CardsInventoryBloc>().add(
                    CardsInventoryFetchRequested(
                      status: context.read<CardsInventoryBloc>().state.status,
                    ),
                  );
                  Navigator.of(dialogContext).pop();
                },
                backgroundColor: AppColors.black,
                text: t.done,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
