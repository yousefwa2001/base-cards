import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:base_cards/core/widgets/icon_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/app_router.gr.dart';
import '../../../../core/extensions/l10n_extension.dart';

class ErrorCard extends StatelessWidget {
  final String message;

  const ErrorCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: context.paddingAll(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.red.withValues(alpha: 0.07),
            border: Border.all(color: Colors.red.withValues(alpha: 0.18)),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline, size: 20.sp, color: Colors.redAccent),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  message.isNotEmpty
                      ? localaizionMessage(context: context, message: message)
                      : context.l10n.unexpectedError,
                  style: context.semiBold12(color: AppColors.black),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        IconLabel(
          icon: const Icon(Icons.call),
          text: context.l10n.contactUs,
          onTap: () async {
            context.router.push(const ContactUsRoute());
          },
        ),
      ],
    );
  }

  String localaizionMessage({
    required BuildContext context,
    required String message,
  }) {
    final t = context.l10n;
    switch (message) {
      case 'insufficient-balance':
        return t.errInsufficientBalance;
      case 'no-cards':
        return t.errNoCards;
      case 'already-sold':
        return t.errAlreadySold;
      case 'invalid-card':
        return t.errInvalidCard;
      default:
        return t.unexpectedError;
    }
  }
}
