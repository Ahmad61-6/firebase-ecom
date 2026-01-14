import 'package:firebase_ecom/app/app_colors.dart';
import 'package:firebase_ecom/app/constants.dart';
import 'package:firebase_ecom/core/utils/device/device_utility.dart';
import 'package:firebase_ecom/core/utils/device/size_utils.dart';
import 'package:firebase_ecom/features/auth/ui/screens/register_screen.dart';
import 'package:firebase_ecom/features/auth/ui/widgets/custom_app_bar.dart';
import 'package:firebase_ecom/features/auth/ui/widgets/custom_button_widget.dart';
import 'package:firebase_ecom/features/auth/ui/widgets/custom_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/scrollable_full_height.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  title: AppConstants.loginScreenText1,
                  subtitle: AppConstants.loginScreenText2,
                  subfontSize: 20,
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
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const CustomButtonWidget(title: "Sign in"),
                    SizedBox(height: 30.h),
                    CustomButtonWidget(
                      title: "Create new account",
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black87,
                      onTap: () => Get.to(() => const RegisterScreen()),
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
