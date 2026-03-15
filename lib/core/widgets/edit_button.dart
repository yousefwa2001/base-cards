import 'package:base_cards/core/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extensions/context_padding_extension.dart';
import '../extensions/context_typography_extension.dart';
import '../theme/app_colors.dart';
import 'responsive_text.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        padding: context.paddingSymmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .12),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveText(
              t.edit,
              style: context.medium14(color: AppColors.white),
            ),
            SizedBox(width: 6.w),
            Icon(Icons.tune, size: 18.sp, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
