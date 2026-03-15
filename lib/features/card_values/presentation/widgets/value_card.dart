import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:base_cards/core/utils/money.dart';
import 'package:base_cards/core/widgets/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/app_router.gr.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/user_role_extension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../cards/presentation/dialogs/buy_card_dialog.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';
import '../../domain/entities/card_value_entity.dart';
import '../dialogs/edit_purchase_price_dialog.dart';

class ValueCard extends StatelessWidget {
  const ValueCard({
    super.key,
    required this.value,
    required this.category,
    required this.region,
  });

  final CardValueEntity value;
  final CardCategoryEntity category;
  final RegionEntity region;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Card(
      color: AppColors.white.withValues(alpha: .1),

      child: ListTile(
        title: Text('${value.value}\$', style: context.medium18()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${Money.toMajor(value.price)} JOD',
              style: context.medium16(),
            ),
            FutureBuilder(
              future: context.isSupplier,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.data ?? false) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${t.purchasePrice} : ${Money.toMajor(value.purchasePrice)} JOD',
                        style: context.medium16(),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          EditButton(
                            onTap: () async {
                              await showEditPurchasePriceDialog(
                                context: context,
                                categoryId: category.id,
                                regionId: region.id,
                                valueId: value.id,
                                currentPrice: value.purchasePrice,
                              );
                            },
                          ),
                          if (!value.isActive) ...[
                            const Center(
                              child: Icon(
                                Icons.priority_high,
                                color: AppColors.red,
                              ),
                            ),
                            Center(
                              child: Text(
                                t.notActive,
                                style: context.bold16(color: AppColors.red),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.white),
        onTap: () async {
          if (await context.isSupplier) {
            context.router.push(
              AddCardRoute(category: category, region: region, value: value),
            );
          } else {
            showBuyCardDialog(
              context: context,

              category: category,
              region: region,
              value: value,
            );
          }
        },
      ),
    );
  }
}
