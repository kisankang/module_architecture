import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_handling_controller.dart';

class SplashHandlingPage extends GetWidget<SplashHandlingController> {
  const SplashHandlingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('splash handling page')),
    );
  }
}
