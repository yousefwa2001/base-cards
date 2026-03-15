import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle _fontByLocale(BuildContext context, {Color? color}) {
    final String locale = Localizations.localeOf(context).languageCode;
    final Color baseColor = color ?? AppColors.white;

    if (locale == 'ar') {
      return GoogleFonts.tajawal(color: baseColor, height: 1);
    } else {
      return GoogleFonts.roboto(color: baseColor);
    }
  }

  // 20
  static TextStyle semiBold20(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600);

  static TextStyle medium20(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500);

  // 18
  static TextStyle medium18(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500);

  // 16
  static TextStyle bold16(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700);

  static TextStyle semiBold16(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle medium16(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500);

  // 15
  static TextStyle medium15(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600);

  // 14
  static TextStyle bold14(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700);

  static TextStyle medium14(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500);

  static TextStyle regular14(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400);

  // 13
  static TextStyle regular13(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400);

  // 12
  static TextStyle semiBold12(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600);

  static TextStyle regular12(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400);

  // 11
  static TextStyle light11(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 11.sp, fontWeight: FontWeight.w400);

  // 10
  static TextStyle regular10(BuildContext context, {Color? color}) =>
      _fontByLocale(
        context,
        color: color,
      ).copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400);
}
