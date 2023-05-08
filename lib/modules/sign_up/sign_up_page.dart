import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/modules/sign_up/sign_up_controller.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class SignUpPage extends GetWidget<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
        appBar: AppBar(
          title: const Text('Sign up'),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                const SizedBox(height: 10),
                TextField(
                  controller: controller.confirmPwEditingController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'confirm password',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: controller.onPressCreateButton,
                      child: Text('Create'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
