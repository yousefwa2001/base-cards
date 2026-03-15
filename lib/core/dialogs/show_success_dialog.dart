import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_cards/core/extensions/l10n_extension.dart';

void showSuccessDialog({
  required BuildContext context,
  String? message,
  VoidCallback? onOk,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      final t = dialogContext.l10n;
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: dialogContext.paddingAll(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 50.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                t.successDialogTitle,
                style: dialogContext
                    .bold16(color: AppColors.black)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                (message != null && message.trim().isNotEmpty)
                    ? message
                    : t.successDialogDefaultMessage,
                textAlign: TextAlign.center,
                style: dialogContext.regular14(color: AppColors.black),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  Navigator.of(dialogContext, rootNavigator: true).pop();

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    onOk?.call();
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    t.successDialogOk,
                    style: dialogContext.regular14().copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
