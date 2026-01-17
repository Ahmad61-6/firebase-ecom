import 'package:firebase_ecom/core/utils/device/size_utils.dart';
import 'package:firebase_ecom/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/constants.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/validators/app_validators.dart';
import '../controller/register_screen_controller.dart';
import '../widgets/custom_button_widget.dart' show CustomButtonWidget;
import '../widgets/custom_title_subtitle.dart';
import '../widgets/scrollable_full_height.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.find<RegisterScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DeviceUtility.hideKeyboard(context),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: ScrollableFullHeight(
            padding: EdgeInsets.all(15.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTitleAndSubtitle(
                    title: AppConstants.registerScreenText1,
                    subtitle: AppConstants.registerScreenText2,
                    subfontSize: 16.h,
                    subfontWight: FontWeight.w800,
                  ),

                  Obx(
                    () => Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.emailController,
                          validator: AppValidators.validateEmail,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black45),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: controller.passwordController1,
                          validator: AppValidators.validatePassword,
                          obscureText:
                              controller.isPasswordVisibleField_1.value,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.togglePasswordVisibility(1);
                              },
                              icon: Icon(
                                controller.isPasswordVisibleField_1.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black45),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: controller.passwordController2,
                          validator: AppValidators.validatePassword,
                          obscureText:
                              controller.isPasswordVisibleField_2.value,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.togglePasswordVisibility(2);
                              },
                              icon: Icon(
                                controller.isPasswordVisibleField_2.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.black45),
                          ),
                        ),

                        SizedBox(height: 40.h),
                        Obx(
                          () => Visibility(
                            visible: controller.isLoading.value == false,
                            replacement: CircularProgressIndicator(),
                            child: CustomButtonWidget(
                              showShadow: true,
                              title: "Sign up",
                              onTap: controller.register,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomButtonWidget(
                          showShadow: false,
                          title: "Already have an account?",
                          backgroundColor: Colors.transparent,
                          textColor: Colors.black87,
                          onTap: () => Get.to(() => const LoginScreen()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
