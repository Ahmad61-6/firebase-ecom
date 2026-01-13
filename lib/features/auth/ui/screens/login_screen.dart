import 'package:firebase_ecom/app/app_colors.dart';
import 'package:firebase_ecom/app/constants.dart';
import 'package:firebase_ecom/core/utils/device/device_utility.dart';
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
        appBar: CustomAppBar(),
        body: SafeArea(
          child: ScrollableFullHeight(
            padding: const EdgeInsets.all(15),
            child: Column(
              // This works perfectly now!
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleAndSubtitle(
                  title: AppConstants.loginScreenText1,
                  subtitle: AppConstants.loginScreenText2,
                  subfontSize: 20,
                  subfontWight: FontWeight.w800,
                ),

                // Grouping inputs and buttons at the bottom
                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButtonWidget(title: "Sign in"),
                    const SizedBox(height: 30),
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
