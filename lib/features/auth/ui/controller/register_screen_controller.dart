import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  final RxBool _isPasswordVisibleField_1 = true.obs;

  RxBool get isPasswordVisibleField_1 => _isPasswordVisibleField_1;

  final RxBool _isPasswordVisibleField_2 = true.obs;

  RxBool get isPasswordVisibleField_2 => _isPasswordVisibleField_2;

  void togglePasswordVisibility(int fieldNumber) {
    if (fieldNumber == 1) {
      _isPasswordVisibleField_1.value = !_isPasswordVisibleField_1.value;
    } else {
      _isPasswordVisibleField_2.value = !_isPasswordVisibleField_2.value;
    }
  }
}
