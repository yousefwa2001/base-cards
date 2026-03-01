import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/theme/app_colors.dart';

class PurchaseDateHeader extends StatelessWidget {
  final String title;
  final int count;

  const PurchaseDateHeader({
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
          padding: context.paddingSymmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.whiteOut,
          ),
          child: Text("$count", style: context.bold16(color: AppColors.black)),
        ),
      ],
    );
  }
}
