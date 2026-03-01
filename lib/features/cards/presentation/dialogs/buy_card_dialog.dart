import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/di/locator.dart';
import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../card_values/domain/entities/card_value_entity.dart';
import '../../../home/domain/entities/card_category_entity.dart';
import '../../../region/domain/entities/region_entity.dart';
import '../blocs/buy_card_bloc/buy_card_bloc.dart';
import '../widgets/buy_cancel_row.dart';
import '../widgets/buy_card_header.dart';
import '../widgets/copy_code_done_row.dart';
import '../widgets/error_card.dart';
import '../widgets/loading_purchase.dart';
import '../widgets/price_chip.dart';
import '../widgets/success_card.dart';

Future<void> showBuyCardDialog({
  required BuildContext context,

  required CardCategoryEntity category,
  required RegionEntity region,
  required CardValueEntity value,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,

    useRootNavigator: false,
    builder: (dialogContext) {
      final t = dialogContext.l10n;
      return PopScope(
        canPop: false,
        child: BlocProvider<BuyCardBloc>(
          create: (_) => getIt<BuyCardBloc>(),

          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Padding(
              padding: context.paddingAll(18),
              child: BlocBuilder<BuyCardBloc, BuyCardState>(
                builder: (context, state) {
                  final isLoading = state is BuyCardLoading;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header
                      BuyCardHeader(isLoading: isLoading),

                      SizedBox(height: 10.h),

                      // Content
                      if (state is BuyCardInitial) ...[
                        Text(
                          t.buyCardSubtitle,
                          style: context.bold14(color: AppColors.black),
                        ),
                        SizedBox(height: 14.h),

                        PriceChip(price: value.price),

                        SizedBox(height: 16.h),

                        BuyCancelRow(
                          category: category,
                          region: region,
                          value: value,
                        ),
                      ] else if (state is BuyCardLoading) ...[
                        SizedBox(height: 6.h),
                        const LoadingPurchase(),
                        SizedBox(height: 12.h),
                      ] else if (state is BuyCardSuccess) ...[
                        SuccessCard(card: state.card),

                        SizedBox(height: 12.h),

                        CopyCodeDoneRow(state: state),
                      ] else if (state is BuyCardError) ...[
                        ErrorCard(message: state.message),
                        SizedBox(height: 14.h),
                        CustomButton(
                          onPressed: () => Navigator.of(dialogContext).pop(),

                          backgroundColor: AppColors.black,

                          text: t.close,
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}
