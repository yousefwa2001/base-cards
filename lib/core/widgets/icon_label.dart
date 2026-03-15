import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/context_typography_extension.dart';
import '../theme/app_colors.dart';
import 'responsive_text.dart';

class IconLabel extends StatelessWidget {
  final Widget icon;
  final String text;
  final TextStyle? style;
  final double gap;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final int maxLines;
  final TextOverflow overflow;
  final VoidCallback? onTap;
  final Widget? child;

  const IconLabel({
    super.key,
    required this.icon,
    this.text = '',
    this.style,
    this.gap = 8,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: gap.w),
          Flexible(
            child:
                child ??
                ResponsiveText(
                  text,
                  maxLines: maxLines,
                  overflow: overflow,
                  style: style ?? context.semiBold16(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
          ),
        ],
      ),
    );
  }
}
