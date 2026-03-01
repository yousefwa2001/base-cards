import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/extensions/l10n_extension.dart';
import '../../../../core/theme/app_colors.dart';

class EditCodeHeader extends StatelessWidget {
  final bool isLoading;
  const EditCodeHeader({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38.w,
          height: 38.w,
          decoration: BoxDecoration(
            color: AppColors.whiteOut,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.edit_outlined, color: AppColors.black, size: 20.sp),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            context.l10n.editCode,
            style: context.bold16(color: AppColors.black),
          ),
        ),
        if (isLoading)
          SizedBox(
            width: 18.w,
            height: 18.w,
            child: const CircularProgressIndicator(strokeWidth: 2.5),
          ),
      ],
    );
  }
}
