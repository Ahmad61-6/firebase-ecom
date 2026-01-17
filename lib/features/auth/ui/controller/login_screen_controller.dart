import 'package:firebase_ecom/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final RxBool _isPasswordVisible = true.obs;
  final isLoading = false.obs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey get formKey => _formKey;

  RxBool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 2));
      isLoading.value = false;
      Get.offAll(
        () => HomeScreen(),
        transition: Transition.fade,
        duration: const Duration(seconds: 1),
      )?.then((_) {
        _resetSignInFields();
      });
    }
  }

  void _resetSignInFields() {
    _emailController.clear();
    _passwordController.clear();
    _isPasswordVisible.value = true;
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }
}
