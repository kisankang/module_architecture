import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/modules/reset_pw/reset_pw_controller.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class ResetPwPage extends GetWidget<ResetPwController> {
  const ResetPwPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
        appBar: AppBar(
          title: const Text('Reset pw'),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() => !controller.isSent.value
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: controller.idEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'email',
                          hintText: 'example@gmail.com',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: controller.onPressSendEmail,
                        child: Text('send'),
                      ),
                    ],
                  )
                : Text('email has been sent to' +
                    '\n' +
                    controller.idEditingController.text +
                    '\n' +
                    'successfully')),
          ),
        ));
  }
}
