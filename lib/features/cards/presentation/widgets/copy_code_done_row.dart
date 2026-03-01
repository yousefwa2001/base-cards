import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../blocs/buy_card_bloc/buy_card_bloc.dart';

class CopyCodeDoneRow extends StatelessWidget {
  const CopyCodeDoneRow({super.key, required this.state});
  final BuyCardSuccess state;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: state.card.code));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.codeCopied),
                    behavior: SnackBarBehavior.floating,
                    margin: context.paddingAll(12),
                  ),
                );
              }
            },

            text: t.copyCode,
            textColor: AppColors.black,
            backgroundColor: AppColors.whiteOut,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CustomButton(
            onPressed: () => Navigator.of(context).pop(),

            backgroundColor: AppColors.black,

            text: t.done,
          ),
        ),
      ],
    );
  }
}
