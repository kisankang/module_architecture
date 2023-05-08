import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/modules/login/login_controller.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlutterLogo(size: 150),
            const SizedBox(height: 20),
            TextField(
              controller: controller.emailEditingController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'email',
                hintText: 'example@gmail.com',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.pwEditingController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: controller.onPressResetPwButton,
                      child: const Text('reset pw'),
                    ),
                    TextButton(
                      onPressed: controller.onPressSignUpButton,
                      child: const Text('sign-up'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: controller.onPressLoginButton,
                  child: const Text('login'),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
