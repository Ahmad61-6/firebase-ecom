import 'package:firebase_ecom/features/auth/ui/screens/profile_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  final RxBool _isPasswordVisibleField_1 = true.obs;

  RxBool get isPasswordVisibleField_1 => _isPasswordVisibleField_1;

  final RxBool _isPasswordVisibleField_2 = true.obs;

  RxBool get isPasswordVisibleField_2 => _isPasswordVisibleField_2;
  final isLoading = false.obs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController1 => _passwordController1;

  TextEditingController get passwordController2 => _passwordController2;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey get formKey => _formKey;

  void togglePasswordVisibility(int fieldNumber) {
    if (fieldNumber == 1) {
      _isPasswordVisibleField_1.value = !_isPasswordVisibleField_1.value;
    } else {
      _isPasswordVisibleField_2.value = !_isPasswordVisibleField_2.value;
    }
  }

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 2));
      if (_passwordController1.text != _passwordController2.text) {
        isLoading.value = false;
        Get.snackbar(
          "Error",
          "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
        return;
      }

      isLoading.value = false;
      Get.to(
        () => ProfileSetupScreen(),
        transition: Transition.leftToRight,
        duration: Duration(milliseconds: 500),
      )?.then((_) {
        _resetRegisterFields();
      });
    }
  }

  void _resetRegisterFields() {
    _emailController.clear();
    _passwordController1.clear();
    _passwordController2.clear();
    _isPasswordVisibleField_1.value = true;
    _isPasswordVisibleField_2.value = true;
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController1.dispose();
    _passwordController2.dispose();
    super.onClose();
  }
}
