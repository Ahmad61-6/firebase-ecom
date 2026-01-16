import 'package:firebase_ecom/features/auth/ui/widgets/custom_profile_image.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/device/size_utils.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_title_subtitle.dart';
import '../widgets/scrollable_full_height.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DeviceUtility.hideKeyboard(context),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: ScrollableFullHeight(
            padding: EdgeInsets.all(15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTitleAndSubtitle(
                  title: AppConstants.profileSetupScreenText1,
                  subtitle: AppConstants.profileSetupScreenText2,
                  subfontSize: 16.h,
                  subfontWight: FontWeight.w800,
                ),
                SizedBox(height: 20.h),
                CustomProfileImage(),
                SizedBox(height: 30.h),

                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Full Name",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      decoration: const InputDecoration(
                        // Added const for optimization
                        hintText: "Address",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    const CustomButtonWidget(title: "Complete Setup"),
                    SizedBox(height: 20.h),
                  ],
                ),
                // CHANGE 3: Removed the extra SizedBox() widgets that were confusing the layout
              ],
            ),
          ),
        ),
      ),
    );
  }
}
