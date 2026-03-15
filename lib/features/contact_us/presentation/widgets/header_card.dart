import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/theme/app_colors.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
  

    return Container(
      width: double.infinity,
      padding: context.paddingAll(14),
      decoration: BoxDecoration(
        color: AppColors.whiteOut.withValues(alpha: .55),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.towInGradiant.withValues(alpha: .25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:context.semiBold16(color: AppColors.black)
          ),
          SizedBox(height: 6.h),
          Text(
            subtitle,
            style: context.semiBold12(color: AppColors.black)
          ),
        ],
      ),
    );
  }
}
