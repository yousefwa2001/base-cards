import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/utils/money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceChip extends StatelessWidget {
  final int price;

  const PriceChip({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Container(
      padding: context.paddingSymmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: Colors.black.withValues(alpha: 0.05),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            size: 18.sp,
            color: Colors.black87,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              t.price,
              style: context.semiBold12(color: AppColors.black),
            ),
          ),
          Text(
            Money.toMajor(price).toString(),
            style: context.bold14(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
