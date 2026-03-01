import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';

void showErrorDialog({required BuildContext context, required String message}) {
  final t = context.l10n;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.redAccent, size: 50.sp),
              SizedBox(height: 16.h),
              Text(
                t.errorDialogTitle,
                style: context
                    .bold16(color: AppColors.black)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                message.isNotEmpty ? message : t.errorDialogDefaultMessage,
                textAlign: TextAlign.center,
                style: context.regular14(color: AppColors.black),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () => context.router.pop(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 10.h,
                  ),
                  child: Text(t.errorDialogOk, style: context.regular14()),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
