import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../card_values/domain/entities/card_value_entity.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';
import '../blocs/buy_card_bloc/buy_card_bloc.dart';

class BuyCancelRow extends StatelessWidget {
  const BuyCancelRow({
    super.key,

    required this.category,
    required this.region,
    required this.value,
  });

  final CardCategoryEntity category;
  final RegionEntity region;
  final CardValueEntity value;
  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () => Navigator.of(context).pop(),

            backgroundColor: AppColors.whiteOut,
            textColor: AppColors.secondary,
            text: t.cancel,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CustomButton(
            onPressed: () {
              context.read<BuyCardBloc>().add(
                BuyCardRequested(
                  category: category,
                  region: region,
                  value: value,
                ),
              );
            },

            backgroundColor: AppColors.black,
            textColor: AppColors.white,

            text: t.buyNow,
          ),
        ),
      ],
    );
  }
}
