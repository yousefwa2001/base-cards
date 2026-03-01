import 'package:auto_route/auto_route.dart';
import 'package:base_cards/app/router/app_router.gr.dart';
import 'package:base_cards/core/utils/money.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/edit_button.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../bloc/shops_bloc.dart';

class ShopCard extends StatelessWidget {
  final UserEntity shop;

  const ShopCard({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingSymmetric(vertical: 8),
      padding: context.paddingAll(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.lighitGrey.withValues(alpha: .6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.h,
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
                  '${context.l10n.balance} : ${Money.toMajor(shop.balance)}',
                  style: context.medium14(color: AppColors.black),
                ),
              ],
            ),
          ),
          EditButton(
            onTap: () async {
              final changed = await context.router.push(
                AdjustBalanceRoute(shop: shop),
              );
              if (changed == true) {
                context.read<ShopsBloc>().add(const FetchShopsRequested());
              }
            },
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
