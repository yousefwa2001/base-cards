import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context_padding_extension.dart';
import '../../../../core/extensions/context_typography_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/responsive_text.dart';

class TypeButton extends StatelessWidget {
  final bool selected;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const TypeButton({super.key, 
    required this.selected,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fg = selected ? AppColors.black : AppColors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        padding: context.paddingSymmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color:
                selected
                    ? Colors.cyan
                    : AppColors.white.withValues(alpha: 0.10),
            width: selected ? 1.4 : 1,
          ),
          gradient:
              selected
                  ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.lighitGrey,
                      AppColors.lighitGrey.withValues(alpha: .88),
                    ],
                  )
                  : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.black,
                      AppColors.black.withValues(alpha: 0.92),
                    ],
                  ),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: Colors.cyan.withValues(alpha: 0.1),
                blurRadius: 14,
                offset: const Offset(0, 2),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.22),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color:
                    selected
                        ? AppColors.white.withValues(alpha: 0.55)
                        : Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, size: 18.sp, color: fg),
            ),
            SizedBox(width: 8.w),
            ResponsiveText(text, style: context.regular12(color: fg)),
          ],
        ),
      ),
    );
  }
}
