import 'package:base_cards/features/adjust_balance/presentation/widgets/type_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/responsive_text.dart';
import '../../../auth/domain/entities/user_entity.dart';
import 'shop_header.dart';

class AdjustBalanceForm extends StatelessWidget {
  final UserEntity shop;
  final TextEditingController amountController;
  final TextEditingController noteController;

  const AdjustBalanceForm({
    super.key,
    required this.shop,
    required this.amountController,
    required this.noteController,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShopHeader(shop: shop),
        SizedBox(height: 16.h),

        const TypeRow(),
        SizedBox(height: 16.h),

        ResponsiveText(t.amount),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          hintText: '0.00',
        ),

        SizedBox(height: 16.h),

        ResponsiveText(t.note),
        SizedBox(height: 8.h),
        CustomTextField(
          textEditingController: noteController,
          maxLines: 3,
          hintText: t.optional,
        ),

        SizedBox(height: 120.h),
      ],
    );
  }
}
