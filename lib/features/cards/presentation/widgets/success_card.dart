import 'package:base_cards/core/widgets/serial_and_expiries_column.dart';
import 'package:base_cards/features/cards/domain/entities/purchased_card_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';

class SuccessCard extends StatelessWidget {
  final PurchasedCardResult card;

  const SuccessCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Container(
      padding: context.paddingAll(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.green.withValues(alpha: 0.08),
        border: Border.all(color: AppColors.green.withValues(alpha: 0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 20.sp,
                color: AppColors.green,
              ),
              SizedBox(width: 8.w),
              Text(
                t.purchaseSuccessTitle,
                style: context.bold14(color: AppColors.black),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(t.codeLabel, style: context.semiBold12(color: AppColors.black)),
          SizedBox(height: 6.h),
          Container(
            padding: context.paddingSymmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Colors.white,
              border: Border.all(color: Colors.black.withValues(alpha: 0.10)),
            ),
            child: SelectableText(
              card.code,
              textAlign: TextAlign.center,
              style: context.bold16(color: AppColors.black),
            ),
          ),
          SizedBox(height: 10.h),
          SerialAndExpiriesColumn(
            expiryMonth: card.expiryMonth,
            expiryYear: card.expiryYear,
            serialNumber: card.serialNumber,
          ),
          SizedBox(height: 10.h),
          Text(
            t.keepCodeSafe,
            style: context.regular13(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
