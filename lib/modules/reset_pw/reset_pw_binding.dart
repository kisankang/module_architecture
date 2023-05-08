import 'package:get/get.dart';
import 'package:module_architecture/modules/reset_pw/reset_pw_controller.dart';

class ResetPwBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPwController(authService: Get.find()));
  }
}
