import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('main page')),
    );
  }
}
