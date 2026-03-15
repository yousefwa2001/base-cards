import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDateHeader extends StatelessWidget {
  final String title;
  final int count;

  const TransactionDateHeader({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: context.semiBold16()),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.grey1.withValues(alpha: .55),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.black.withValues(alpha: .25)),
          ),
          child: Text("$count", style: context.medium14()),
        ),
      ],
    );
  }
}
