import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/services/auth_service.dart';
import 'package:module_architecture/routes/app_pages.dart';
import 'package:module_architecture/utils/custom_dialog.dart';

class LoginController extends GetxController {
  AuthService authService;
  LoginController({required this.authService});

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController pwEditingController = TextEditingController();

  _goToWelcomePage() => Get.toNamed(Routes.WELCOME);
  _goToResetPwPage() => Get.toNamed(Routes.RESETPW);
  _goToSignUpPage() => Get.toNamed(Routes.SIGNUP);

  onPressLoginButton() async {
    if (emailEditingController.text == '') {
      CustomDialog.problem('Fill in email address');
    } else if (pwEditingController.text == '') {
      CustomDialog.problem('Fill in password');
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      if (await authService.signInWithEmailAndPassword(
          email: emailEditingController.text,
          password: pwEditingController.text)) {
        _goToWelcomePage();
      }
      EasyLoading.dismiss();
    }
  }

  onPressSignUpButton() => _goToSignUpPage();

  onPressResetPwButton() => _goToResetPwPage();
}
