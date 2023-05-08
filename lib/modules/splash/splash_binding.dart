import 'package:get/get.dart';
import 'package:module_architecture/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(localService: Get.find()));
  }
}
