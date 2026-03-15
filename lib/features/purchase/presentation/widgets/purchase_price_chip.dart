import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/utils/money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchasePriceChip extends StatelessWidget {
  final int price;
  final String currency;

  const PurchasePriceChip({
    super.key,
    required this.price,
    this.currency = "JOD",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingSymmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.bbBlue,
      ),

      child: Text(
        "${Money.toMajor(price)} $currency",
        style: context.bold16(color: AppColors.black),
      ),
    );
  }
}
