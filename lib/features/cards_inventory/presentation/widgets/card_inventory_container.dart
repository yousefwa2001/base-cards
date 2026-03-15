import 'package:base_cards/features/cards_inventory/presentation/bloc/cards_inventory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../cards/domain/entities/card_entity.dart';
import '../../../cards/presentation/dialogs/show_edit_card_code_dialog.dart';

class CardInventoryContainer extends StatelessWidget {
  const CardInventoryContainer({
    super.key,
    required this.card,
    required this.sold,
  });

  final CardEntity card;
  final bool sold;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Container(
      padding: context.paddingAll(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "${t.cardCode} : ${card.code}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.semiBold16(color: AppColors.black),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                sold ? t.sold : t.available,
                style: context.regular14(
                  color: sold ? AppColors.red : AppColors.green1,
                ),
              ),
              IconButton(
                onPressed:
                    () => Clipboard.setData(ClipboardData(text: card.code)),
                icon: Icon(Icons.copy, size: 18.sp),
              ),
            ],
          ),

          Text(
            "${t.serial_number} : ${card.serialNumber}",

            overflow: TextOverflow.ellipsis,
            style: context.medium14(color: AppColors.black),
          ),
          if (card.expiryMonth != null && card.expiryYear != null) ...[
            SizedBox(height: 10.h),

            Row(
              spacing: 30.w,
              children: [
                Text(
                  "${t.expiry_month} : ${card.expiryMonth}",

                  overflow: TextOverflow.ellipsis,
                  style: context.medium14(color: AppColors.black),
                ),
                Text(
                  "${t.expiry_year} : ${card.expiryYear}",

                  overflow: TextOverflow.ellipsis,
                  style: context.medium14(color: AppColors.black),
                ),
              ],
            ),
          ],
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${card.category} • ${card.region} • ${card.value}",
                style: context.bold16(color: AppColors.black),
              ),
              if (!sold)
                CustomButton(
                  backgroundColor: AppColors.navy.withValues(alpha: .8),
                  height: 30,
                  width: 80,
                  fontSize: 12,
                  text: t.edit,
                  onPressed: () async {
                    await showEditCardCodeDialog(
                      cardId: card.id ?? '',
                      inventoryBloc: context.read<CardsInventoryBloc>(),
                      context: context,
                      currentCode: card.code,
                      currentExpiryMonth: card.expiryMonth,
                      currentExpiryYear: card.expiryYear,
                      currentSerialNumber: card.serialNumber,
                    );
                  },
                ),
            ],
          ),
          if (sold) ...[
            SizedBox(height: 6.h),
            Text(
              "${t.buyerName} : ${card.buyerName ?? '-'}",
              style: context.regular12(color: AppColors.black),
            ),
          ],
        ],
      ),
    );
  }
}
