import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/services/auth_service.dart';
import 'package:module_architecture/routes/app_pages.dart';
import 'package:module_architecture/utils/custom_dialog.dart';

class SignUpController extends GetxController {
  AuthService authService;
  SignUpController({required this.authService});

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController pwEditingController = TextEditingController();
  TextEditingController confirmPwEditingController = TextEditingController();

  _goToLoginPage() => Get.toNamed(Routes.LOGIN);
  _goToWelcomePage() => Get.toNamed(Routes.WELCOME);

  onPressCreateButton() async {
    if (emailEditingController.text == '') {
      CustomDialog.problem('Fill in email address');
    } else if (pwEditingController.text == '') {
      CustomDialog.problem('Fill in password');
    } else if (confirmPwEditingController.text == '') {
      CustomDialog.problem('Fill in confirm password');
    } else if (pwEditingController.text != confirmPwEditingController.text) {
      CustomDialog.problem('Password and confrim password is not correct');
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      if (await authService.createUserWithEmailAndPassword(
          email: emailEditingController.text,
          password: pwEditingController.text)) {
        _goToLoginPage();
      }

      EasyLoading.dismiss();
    }
  }
}
