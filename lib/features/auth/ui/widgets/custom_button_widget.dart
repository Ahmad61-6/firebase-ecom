import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.4),
              // Same color but transparent
              blurRadius: 20,
              // How "soft" or "diffuse" the shadow is (the "hint")
              spreadRadius: 0,
              // How much the shadow grows bigger than the button
              offset: const Offset(0, 10), // Moves the shadow down (elevation)
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? AppColors.lightThemeBackgroundColor,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
