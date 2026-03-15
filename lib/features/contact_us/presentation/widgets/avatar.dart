import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.initials});
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.sp,
      height: 44.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.grey1.withValues(alpha: .25)),
      ),
      child: Text(initials, style: context.semiBold16(color: AppColors.black)),
    );
  }
}
