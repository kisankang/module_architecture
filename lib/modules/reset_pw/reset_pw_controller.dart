import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/services/auth_service.dart';
import 'package:module_architecture/utils/custom_dialog.dart';

class ResetPwController extends GetxController {
  AuthService authService;
  ResetPwController({required this.authService});

  TextEditingController idEditingController = TextEditingController();
  Rx<bool> isSent = false.obs;

  onPressSendEmail() async {
    if (idEditingController.text == '') {
      CustomDialog.problem('Fill in your email address');
    } else {
      EasyLoading.show();
      isSent.value =
          await authService.sendPasswordResetEmail(idEditingController.text);
      EasyLoading.dismiss();
    }
  }
}
