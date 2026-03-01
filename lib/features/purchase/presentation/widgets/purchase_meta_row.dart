import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/theme/app_colors.dart';

class PurchaseMetaRow extends StatelessWidget {
  final IconData leftIcon;
  final String leftText;
  final IconData rightIcon;
  final String rightText;

  const PurchaseMetaRow({
    super.key,
    required this.leftIcon,
    required this.leftText,
    required this.rightIcon,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(leftIcon, size: 18.sp, color: AppColors.grey1),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            leftText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.medium15(color: AppColors.grey1),
          ),
        ),
        SizedBox(width: 12.w),
        Icon(rightIcon, size: 18.sp, color: AppColors.grey1),
        SizedBox(width: 6.w),
        Text(rightText, style: context.medium15(color: AppColors.grey1)),
      ],
    );
  }
}
