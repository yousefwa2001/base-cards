import 'package:flutter/material.dart';
import '../theme/app_typography.dart';

extension TypographyContextExtension on BuildContext {
  // 20
  TextStyle semiBold20({Color? color}) =>
      AppTypography.semiBold20(this, color: color);
  TextStyle medium20({Color? color}) =>
      AppTypography.medium20(this, color: color);

  // 18
  TextStyle medium18({Color? color}) =>
      AppTypography.medium18(this, color: color);

  // 16
  TextStyle bold16({Color? color}) =>
      AppTypography.bold16(this, color: color);
  TextStyle semiBold16({Color? color}) =>
      AppTypography.semiBold16(this, color: color);
  TextStyle medium16({Color? color}) =>
      AppTypography.medium16(this, color: color);

  // 15
  TextStyle medium15({Color? color}) =>
      AppTypography.medium15(this, color: color);

  // 14
  TextStyle bold14({Color? color}) =>
      AppTypography.bold14(this, color: color);
  TextStyle medium14({Color? color}) =>
      AppTypography.medium14(this, color: color);
  TextStyle regular14({Color? color}) =>
      AppTypography.regular14(this, color: color);

  // 13
  TextStyle regular13({Color? color}) =>
      AppTypography.regular13(this, color: color);

  // 12
  TextStyle semiBold12({Color? color}) =>
      AppTypography.semiBold12(this, color: color);
  TextStyle regular12({Color? color}) =>
      AppTypography.regular12(this, color: color);

  // 11
  TextStyle light11({Color? color}) =>
      AppTypography.light11(this, color: color);

  // 10
  TextStyle regular10({Color? color}) =>
      AppTypography.regular10(this, color: color);
}
