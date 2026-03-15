import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';

class LoadingPurchase extends StatelessWidget {
  const LoadingPurchase({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 26.w,
            height: 26.w,
            child: const CircularProgressIndicator(strokeWidth: 3),
          ),
          SizedBox(height: 12.h),
          Text(
            t.processingPurchase,
            style: context.medium14(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
