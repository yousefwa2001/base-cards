import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    super.key,
    required this.icon,
    required this.onTap,
    required this.tooltip,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        child: Container(
          width: 38.sp,
          height: 38.sp,
          decoration: BoxDecoration(
            color: AppColors.lighitGrey,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.grey1.withValues(alpha: .25)),
          ),
          child: Icon(icon, size: 20.r, color: iconColor),
        ),
      ),
    );
  }
}
