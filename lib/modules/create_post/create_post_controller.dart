import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/models/post.dart';
import 'package:module_architecture/data/services/account_service.dart';
import 'package:module_architecture/data/services/forum_service.dart';
import 'package:module_architecture/utils/custom_dialog.dart';

class CreatePostController extends GetxController {
  AccountService accountService;
  ForumService forumService;
  CreatePostController({
    required this.accountService,
    required this.forumService,
  });

  TextEditingController titleEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();

  _goToPreviousPage() => Get.back();

  onPressCreateButton() async {
    if (titleEditingController.text == '') {
      CustomDialog.problem('fill in title');
    } else if (contentEditingController.text == '') {
      CustomDialog.problem('fill in content');
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      Post post = Post(
        title: titleEditingController.text,
        content: contentEditingController.text,
        createrId: accountService.myAccount?.id ?? 'bug data',
        createAt: DateTime.now().millisecondsSinceEpoch,
        deleteAt: null,
        likeUserId: [],
        replies: [],
      );
      if (await forumService.createPost(post)) {
        _goToPreviousPage();
      }
      EasyLoading.dismiss();
    }
  }
}
