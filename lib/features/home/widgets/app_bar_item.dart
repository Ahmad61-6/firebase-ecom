import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../../../core/utils/device/size_utils.dart';

class AppBarItem extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const AppBarItem({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.appBarItemBackgroundColor.withValues(alpha: 0.3),
        ),
        child: IconButton(onPressed: onTap, icon: Icon(icon)),
      ),
    );
  }
}
