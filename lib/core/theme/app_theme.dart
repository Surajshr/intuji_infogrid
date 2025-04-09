import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intuji_infogrid/core/constants/app_color.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: AppColor.kPrimaryColor,
        secondary: AppColor.kSecondaryColor,

        surface: AppColor.kSecondaryColor,
        onPrimary: AppColor.kTextColor,
        onSecondary: AppColor.kTextColor,

        onSurface: AppColor.kTextColor,
        error: AppColor.kErrorColor,
        onError: Colors.white,
      ),

      // Typography
      textTheme: Theme.of(context).textTheme.apply(
        fontFamily: 'Roboto',
        bodyColor: AppColor.kTextColor,
        displayColor: AppColor.kTextColor,
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.kPrimaryColor,
        foregroundColor: AppColor.kTextColor,
        elevation: 0,
        centerTitle: true,
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColor.kSecondaryColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.kPrimaryColor,
          foregroundColor: AppColor.kTextColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.kPrimaryColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.kPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.kErrorColor),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),

      // Other Configurations
      scaffoldBackgroundColor: AppColor.kSecondaryColor,
      dividerColor: AppColor.kTextDisabledColor.withOpacity(0.2),
      disabledColor: AppColor.kTextDisabledColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.kPrimaryColor,
        circularTrackColor: AppColor.kPrimaryColorLight,
      ),
    );
  }
}
