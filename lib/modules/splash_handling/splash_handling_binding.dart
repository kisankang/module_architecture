import 'package:get/get.dart';

import 'splash_handling_controller.dart';

class SplashHandlingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashHandlingController());
  }
}
