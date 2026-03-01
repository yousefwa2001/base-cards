import 'package:base_cards/core/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double fontSize;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isOutlined;
  final IconData? icon;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 15,
    this.height,
    this.width,
    this.textColor,
    this.backgroundColor,
    this.isOutlined = false,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = height ?? 50.sp;
    final double buttonWidth = width ?? MediaQuery.of(context).size.width - 50;
    final double fontSizeSp = fontSize.sp;

    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isOutlined
                  ? Colors.transparent
                  : (backgroundColor ?? Colors.cyan),
          foregroundColor: textColor ?? Colors.white,
          side:
              isOutlined
                  ? BorderSide(color: backgroundColor ?? Colors.cyan, width: 2)
                  : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
          elevation: isOutlined ? 0 : 2,
        ),
        child:
            isLoading
                ? SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 18.sp),
                      SizedBox(width: 8.w),
                    ],
                    if (buttonWidth < 80.w)
                      Expanded(child: theText(fontSizeSp))
                    else
                      theText(fontSizeSp),
                  ],
                ),
      ),
    );
  }

  ResponsiveText theText(double fontSizeSp) {
    return ResponsiveText(
      text,
      style: TextStyle(
        fontSize: fontSizeSp,
        fontWeight: FontWeight.bold,
        color:
            isOutlined
                ? (backgroundColor ?? Colors.cyan)
                : (textColor ?? Colors.white),
      ),
    );
  }
}
