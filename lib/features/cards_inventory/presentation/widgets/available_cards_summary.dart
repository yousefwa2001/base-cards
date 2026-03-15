import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/app_router.gr.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/icon_label.dart';
import '../../../card_values/domain/entities/card_value_entity.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';

class AvailableCardsSummary extends StatelessWidget {
  const AvailableCardsSummary({
    super.key,

    required this.availableCount,
    required this.category,
    required this.region,
    required this.value,
  });

  final int availableCount;
  final CardCategoryEntity? category;
  final RegionEntity? region;
  final CardValueEntity? value;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
          padding: context.paddingSymmetric(horizontal: 10, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
            side: const BorderSide(color: AppColors.whiteOut),
          ),
          backgroundColor: AppColors.whiteOut,
          avatar: Icon(
            Icons.inventory_2_outlined,
            size: 18.sp,
            color: AppColors.gradientStart,
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t.availableCards,
                style: context.bold16(color: AppColors.black),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: context.paddingSymmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: AppColors.black,
                ),
                child: Text(
                  '$availableCount',
                  style: context.bold16(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
        if (category != null && region != null && value != null)
          IconLabel(
            icon: const Icon(Icons.add, color: AppColors.white),
            child: Text(t.addCard),
            onTap: () {
              context.router.push(
                AddCardRoute(
                  category: category!,
                  region: region!,
                  value: value!,
                ),
              );
            },
          ),
      ],
    );
  }
}
