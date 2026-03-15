import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsivePaddingExtension on BuildContext {
  EdgeInsets paddingAll(double value) => EdgeInsets.all(value.w);

  EdgeInsets paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);

  EdgeInsetsDirectional paddingDir({
    double start = 0,
    double end = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return EdgeInsetsDirectional.only(
      start: start.w,
      end: end.w,
      top: top.h,
      bottom: bottom.h,
    );
  }
}
