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
        appBar: CustomAppBar(),
        body: SafeArea(
          child: ScrollableFullHeight(
            padding: const EdgeInsets.all(15),
            child: Column(
              // This works perfectly now!
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleAndSubtitle(
                  title: AppConstants.registerScreenText1,
                  subtitle: AppConstants.registerScreenText2,
                  subfontSize: 16,
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
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.black45),
                      ),
                    ),

                    const SizedBox(height: 40),
                    CustomButtonWidget(title: "Sign up"),
                    const SizedBox(height: 20),
                    CustomButtonWidget(
                      title: "Already have an account?",
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black87,
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
