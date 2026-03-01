import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';

class PurchaseCodeBox extends StatelessWidget {
  final String code;
  final VoidCallback onCopy;

  const PurchaseCodeBox({super.key, required this.code, required this.onCopy});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Container(
      padding: context.paddingAll(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade300),
        color: AppColors.whiteOut,
      ),
      child: Row(
        children: [
          Expanded(
            child: SelectableText(
              code,
              style: context.bold16(color: AppColors.black),
            ),
          ),
          SizedBox(width: 10.w),
          IconButton.filledTonal(
            onPressed: onCopy,
            icon: Icon(Icons.copy_rounded, size: 18.sp),
            tooltip: t.copyCode,
          ),
        ],
      ),
    );
  }
}
