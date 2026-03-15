import 'package:base_cards/core/enums/balance_direction.dart';
import 'package:base_cards/core/extensions/context_locale_extension.dart';
import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/utils/money.dart';
import 'package:base_cards/features/adjust_balance/domain/entities/balance_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatelessWidget {
  final BalanceEntity item;
  const TransactionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    final isCredit =
        item.direction.value.toLowerCase() == BalanceDirection.credit.value;

    return Container(
      padding: context.paddingAll(14),
      decoration: BoxDecoration(
        color: AppColors.whiteOut,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.black.withValues(alpha: .25)),
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            offset: const Offset(0, 6),
            color: Colors.black.withValues(alpha: .06),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.sp,
            height: 44.sp,
            decoration: BoxDecoration(
              color: AppColors.grey1.withValues(alpha: .6),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(isCredit ? Icons.add : Icons.minimize, size: 22.r),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // amount + type
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${isCredit ? "+" : "-"} ${Money.toMajor(item.amount)}",
                        style: context.semiBold16(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),

                // parties
                Text(
                  "${t.tx_shop}: ${item.shopName}",
                  style: context.semiBold12(color: AppColors.black),
                ),
                SizedBox(height: 4.h),
                Text(
                  "${t.tx_supplier}: ${item.supplierName}",
                  style: context.semiBold12(color: AppColors.black),
                ),

                SizedBox(height: 10.h),

                // balances (compact)
                _MiniBalanceRow(
                  label: t.balance,
                  before: Money.toMajor(item.shopBalanceBefore),
                  after: Money.toMajor(item.shopBalanceAfter),
                  diff: Money.toMajor(item.amount),
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniBalanceRow extends StatelessWidget {
  const _MiniBalanceRow({
    required this.label,
    required this.before,
    required this.after,
    required this.diff,
  });

  final String label;
  final double before;
  final double after;
  final double diff;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "$label : $before ${context.isArabic ? "←" : '→'} $after",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.semiBold12(color: AppColors.black),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: context.paddingSymmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.grey1.withValues(alpha: .55),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.grey.withValues(alpha: .25)),
          ),
          child: Text(
            "${before < after ? "+" : "-"}$diff",
            style: context.semiBold12(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
