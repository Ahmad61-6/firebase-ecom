import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool showShadow;

  const CustomButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    required this.showShadow,
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
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.4),

                    blurRadius: 20,

                    spreadRadius: 0,

                    offset: const Offset(0, 10),
                  ),
                ]
              : null,
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
