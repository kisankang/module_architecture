import 'package:get/get.dart';
import 'package:module_architecture/modules/sign_up/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(authService: Get.find()));
  }
}
