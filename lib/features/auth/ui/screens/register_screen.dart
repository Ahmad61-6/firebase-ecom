import 'package:firebase_ecom/core/utils/device/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button_widget.dart' show CustomButtonWidget;
import '../widgets/custom_title_subtitle.dart';
import '../widgets/scrollable_full_height.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTitleAndSubtitle(
                  title: AppConstants.registerScreenText1,
                  subtitle: AppConstants.registerScreenText2,
                  subfontSize: 16,
                  subfontWight: FontWeight.w800,
                ),

                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),

                    SizedBox(height: 40.h),
                    const CustomButtonWidget(title: "Sign up"),
                    SizedBox(height: 20.h),
                    CustomButtonWidget(
                      title: "Already have an account?",
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black87,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
