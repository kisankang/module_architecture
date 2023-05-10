import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/modules/create_post/create_post_controller.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class CreatePostPage extends GetWidget<CreatePostController> {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
      appBar: AppBar(
        title: const Text('Create post'),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: controller.titleEditingController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: controller.contentEditingController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'content',
                  border: OutlineInputBorder(),
                ),
                expands: true,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            ElevatedButton(
              onPressed: controller.onPressCreateButton,
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
