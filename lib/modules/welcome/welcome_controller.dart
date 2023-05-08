import 'package:get/get.dart';
import 'package:module_architecture/routes/app_pages.dart';

class WelcomeController extends GetxController {
  _goToMainPage() => Get.toNamed(Routes.MAIN);
  onPressEnter() => _goToMainPage();
}
