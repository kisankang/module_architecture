import 'package:get/get.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_page.dart';
import '../modules/splash_handling/splash_handling_binding.dart';
import '../modules/splash_handling/splash_handling_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH_HANDLING,
      page: () => const SplashHandlingPage(),
      binding: SplashHandlingBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
  ];
}
