import 'package:firebase_ecom/features/auth/ui/controller/register_screen_controller.dart';
import 'package:get/get.dart';

import '../../features/auth/ui/controller/login_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<LoginScreenController>(LoginScreenController());
    Get.put<RegisterScreenController>(RegisterScreenController());
  }
}
