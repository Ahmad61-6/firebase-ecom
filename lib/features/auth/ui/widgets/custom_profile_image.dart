import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../core/utils/device/size_utils.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor, width: 2.5.w),
            image: const DecorationImage(
              image: AssetImage(AssetPaths.blankProfileImage),
            ),
          ),
        ),
        Positioned(
          bottom: 3,
          right: 1,
          left: 70,
          child: Container(
            height: 25.h,
            width: 25.w,

            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 2.h),
            ),
            child: Icon(
              Icons.camera_alt,
              color: AppColors.primaryColor,
              size: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
