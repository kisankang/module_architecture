import 'package:get/get.dart';
import 'package:module_architecture/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(authService: Get.find()));
  }
}
