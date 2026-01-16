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

import '../controller/login_screen_controller.dart';
import '../widgets/scrollable_full_height.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginScreenController controller = Get.find<LoginScreenController>();

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
                CustomTitleAndSubtitle(
                  title: AppConstants.loginScreenText1,
                  subtitle: AppConstants.loginScreenText2,
                  subfontSize: 20.h,
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
                    Obx(
                      () => TextFormField(
                        obscureText: controller.isPasswordVisible.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.togglePasswordVisibility();
                            },
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black45),
                        ),
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
