import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/theme/app_colors.dart';

class BuyCardHeader extends StatelessWidget {
  const BuyCardHeader({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Row(
      children: [
        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.black.withValues(alpha: 0.06),
          ),
          child: Icon(
            Icons.confirmation_number_outlined,
            size: 22.sp,
            color: AppColors.black,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            t.buyCardTitle,
            style: context.semiBold16(color: AppColors.black),
          ),
        ),
        IconButton(
          onPressed: isLoading ? null : () => Navigator.of(context).pop(),
          icon: Icon(Icons.close, size: 20.sp),
          splashRadius: 18.r,
        ),
      ],
    );
  }
}
