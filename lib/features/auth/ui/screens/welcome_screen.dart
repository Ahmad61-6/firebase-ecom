import 'package:firebase_ecom/app/app_colors.dart';
import 'package:firebase_ecom/app/asset_paths.dart';
import 'package:firebase_ecom/app/constants.dart';
import 'package:firebase_ecom/features/auth/ui/screens/login_screen.dart';
import 'package:firebase_ecom/features/auth/ui/screens/register_screen.dart';
import 'package:firebase_ecom/features/auth/ui/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: .center,

            children: [
              Image.asset(AssetPaths.welcomeScreenImage),
              const SizedBox(height: 20),
              Text(
                textAlign: .center,
                AppConstants.welcomeScreenText1,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppConstants.welcomeScreenTex2,
                textAlign: .center,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      onTap: () => Get.to(() => const LoginScreen()),
                      title: 'Login',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomButtonWidget(
                      onTap: () => Get.to(() => const RegisterScreen()),
                      title: "Register",
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
