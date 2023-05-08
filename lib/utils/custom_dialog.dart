import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static success(String content) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: Text(content),
          );
        });
  }

  static problem(String content) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Problem'),
            content: Text(content),
          );
        });
  }

  static fail(String content) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Failed'),
            content: Text(content),
          );
        });
  }
}
