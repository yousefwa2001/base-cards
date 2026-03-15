import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/context_typography_extension.dart';
import '../../../../../core/theme/app_colors.dart';

class EditCardLoadingSection extends StatelessWidget {
  final BuildContext dialogContext;
  final String savingText;

  const EditCardLoadingSection({
    super.key,
    required this.dialogContext,
    required this.savingText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Center(
          child: SizedBox(
            width: 26.w,
            height: 26.w,
            child: const CircularProgressIndicator(strokeWidth: 3),
          ),
        ),
        SizedBox(height: 10.h),
        Center(
          child: Text(
            savingText,
            style: dialogContext.medium14(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
