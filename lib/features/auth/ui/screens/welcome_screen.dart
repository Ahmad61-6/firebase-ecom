import 'package:firebase_ecom/app/asset_paths.dart';
import 'package:firebase_ecom/app/constants.dart';
import 'package:firebase_ecom/features/auth/ui/screens/login_screen.dart';
import 'package:firebase_ecom/features/auth/ui/screens/register_screen.dart';
import 'package:firebase_ecom/features/auth/ui/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_title_subtitle.dart';

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
            mainAxisAlignment: .spaceBetween,
            children: [
              Image.asset(AssetPaths.welcomeScreenImage),
              CustomTitleAndSubtitle(
                title: AppConstants.welcomeScreenText1,
                subtitle: AppConstants.welcomeScreenTex2,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      onTap: () => Get.to(() => const LoginScreen()),
                      title: 'Login',
                      showShadow: true,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomButtonWidget(
                      onTap: () => Get.to(() => const RegisterScreen()),
                      title: "Register",
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black,
                      showShadow: false,
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
