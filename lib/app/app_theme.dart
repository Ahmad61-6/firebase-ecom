import 'package:firebase_ecom/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.lightThemeBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        surface: AppColors.lightThemeBackgroundColor,
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: AppColors.filledBackgroundColor,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
