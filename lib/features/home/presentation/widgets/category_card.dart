import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/app_router.gr.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_cached_image.dart';
import '../../domain/entities/card_category_entity.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CardCategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return GestureDetector(
      onTap: () {
        context.router.push(RegionRoute(category: category));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Color(int.parse('0xFF${category.color.replaceAll('#', '')}')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!category.isActive) ...[
              const Icon(Icons.priority_high, color: AppColors.red),
              Text(t.notActive, style: context.bold16(color: AppColors.red)),
              SizedBox(height: 10.h),
            ],
            if (category.imageUrl.isNotEmpty)
              Padding(
                padding: context.paddingDir(bottom: 8),
                child: CustomCachedImage(
                  width: 48,
                  height: 48,
                  imageUrl: category.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            Text(category.name, style: context.bold16(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}
