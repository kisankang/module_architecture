import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/modules/welcome/welcome_controller.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class WelComePage extends GetWidget<WelcomeController> {
  const WelComePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Page'),
        ),
        body: Center(child: Text('hello'.tr)),
      ),
    );
  }
}
