import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData build({required bool isArabic}) {
    final baseFont =
        isArabic
            ? GoogleFonts.tajawal(color: AppColors.white, height: 1.4)
            : GoogleFonts.roboto(color: AppColors.white, height: 1.3);

    final textTheme = TextTheme(
      displayLarge: baseFont.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: baseFont.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: baseFont.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: baseFont.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: baseFont.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: baseFont.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );

    return ThemeData(
      textTheme: textTheme,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.whiteOut,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
        scrolledUnderElevation: 0,

        iconTheme: IconThemeData(color: Colors.white, size: 24.sp),
      ),
    );
  }
}
