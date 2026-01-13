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
    );
  }
}
