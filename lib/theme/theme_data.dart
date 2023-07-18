import 'package:flutter/material.dart';
import 'package:flutter_linkedin/theme/app_color.dart';

ThemeData getThemes() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.gray100,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      error: AppColors.errorColor,
      secondary: AppColors.secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 5,
      color: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        color: AppColors.primaryColor,
      ),
      fillColor: AppColors.gray200,
      filled: true,
      disabledBorder: borderStyle(),
      enabledBorder: borderStyle(),
      errorBorder: errorBorderStyle(),
      focusedBorder: borderStyle(),
      focusedErrorBorder: errorBorderStyle(),
      errorStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    useMaterial3: true,
  );
}

OutlineInputBorder borderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: AppColors.primaryColor,
      width: 3,
    ),
  );
}

OutlineInputBorder errorBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: AppColors.errorColor,
      width: 3,
    ),
  );
}
