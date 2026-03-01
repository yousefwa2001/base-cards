import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';

class PurchaseEmpty extends StatelessWidget {
  const PurchaseEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Center(
      child: Padding(
        padding: context.paddingAll(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long, size: 56.sp, color: Colors.grey.shade500),
            SizedBox(height: 12.h),
            Text(
              t.no_purchases_yet_title,
              style: context.medium16(color: AppColors.grey),
            ),
            SizedBox(height: 30.h),
            Text(
              t.no_purchases_yet_subtitle,
              textAlign: TextAlign.center,
              style: context.medium18(),
            ),
          ],
        ),
      ),
    );
  }
}
