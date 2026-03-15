import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../../auth/domain/entities/user_entity.dart';

class ShopHeader extends StatelessWidget {
  final UserEntity shop;
  const ShopHeader({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.lighitGrey.withValues(alpha: .6)),
      ),
      child: Row(
        children: [
          Container(
            width: 46.w,
            height: 46.h,
            decoration: BoxDecoration(
              color: AppColors.lighitGrey,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.storefront_outlined, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  shop.name,
                  style: context.medium14(color: AppColors.black),
                ),
                SizedBox(height: 6.h),
                ResponsiveText(
                  '${t.balance} : ${Money.toMajor(shop.balance)}',
                  style: context.medium14(color: AppColors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}