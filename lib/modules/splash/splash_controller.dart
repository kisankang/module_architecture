import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/services/local_service.dart';
import 'package:module_architecture/routes/app_pages.dart';
import 'package:module_architecture/utils/log.dart';

int delay = 0;

class SplashController extends GetxController {
  LocalService localService;
  SplashController({required this.localService});

  goToWelcomePage() {
    Future.delayed(Duration(seconds: delay), () {
      FlutterNativeSplash.remove();
      Get.offAllNamed(Routes.WELCOME);
    });
  }

  goToLoginPage() {
    Future.delayed(Duration(seconds: delay), () {
      FlutterNativeSplash.remove();
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  load() {
    final token = localService.token;
    if (token != null) {
      logSuccess(token);
      goToWelcomePage();
    } else {
      goToLoginPage();
    }
  }

  @override
  void onInit() {
    super.onInit();
    load();
  }
}
