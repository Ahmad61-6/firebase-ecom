import 'package:get/get.dart';

import '../../features/auth/ui/controller/login_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<LoginScreenController>(LoginScreenController());
  }
}
