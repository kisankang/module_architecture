import 'package:get/get.dart';
import 'package:module_architecture/modules/splash/splash_binding.dart';
import 'package:module_architecture/modules/splash/splash_page.dart';
import 'package:module_architecture/modules/welcome/welcome_binding.dart';
import 'package:module_architecture/modules/welcome/welcome_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelComePage(),
      binding: WelcomeBinding(),
    ),
  ];
}
