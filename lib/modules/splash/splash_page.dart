import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/modules/splash/splash_controller.dart';

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: const Text('This is the Splash page'),
    );
  }
}
