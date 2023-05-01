import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:module_architecture/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  goToWelcomePage() {
    FlutterNativeSplash.remove();
    Get.offAllNamed(Routes.WELCOME);
  }

  load() async {
    bool loadResult = false;

    // Add some load data process
    await Future.delayed(const Duration(milliseconds: 3000))
        .then((value) => loadResult = true);

    if (loadResult) {
      goToWelcomePage();
    } else {
      //
    }
  }

  @override
  void onInit() async {
    await load();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    super.onInit();
  }
}
