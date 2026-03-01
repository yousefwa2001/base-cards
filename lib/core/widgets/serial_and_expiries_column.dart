import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/context_typography_extension.dart';
import '../theme/app_colors.dart';

class SerialAndExpiriesColumn extends StatelessWidget {
  final int? expiryMonth;
  final int? expiryYear;
  final String serialNumber;
  const SerialAndExpiriesColumn({
    super.key,
    required this.expiryMonth,
    required this.expiryYear,
    required this.serialNumber,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              "${t.serial_number} : ",
              style: context.bold14(color: AppColors.black),
            ),
            SelectableText(
              serialNumber,
              textAlign: TextAlign.center,
              style: context.medium14(color: AppColors.black),
            ),
          ],
        ),

        if (expiryMonth != null && expiryYear != null) ...[
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    t.expiryYear,
                    style: context.semiBold16(color: AppColors.black),
                  ),
                  Text(
                    expiryYear.toString(),
                    style: context.medium14(color: AppColors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    t.expiryMonth,
                    style: context.semiBold16(color: AppColors.black),
                  ),
                  Text(
                    expiryMonth.toString(),
                    style: context.medium14(color: AppColors.black),
                  ),
                ],
              ),
            ],
          ),
        ],
      ],
    );
  }
}
