import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/theme/app_colors.dart';

class SuccessPill extends StatelessWidget {
  final String text;
  const SuccessPill({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingSymmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteOut,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.black.withValues(alpha: .08)),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: AppColors.black, size: 18.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(text, style: context.medium14(color: AppColors.black)),
          ),
        ],
      ),
    );
  }
}
