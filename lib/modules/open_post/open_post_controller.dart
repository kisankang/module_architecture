import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/models/account.dart';
import 'package:module_architecture/data/models/post.dart';
import 'package:module_architecture/data/models/reply.dart';
import 'package:module_architecture/data/services/account_service.dart';
import 'package:module_architecture/data/services/forum_service.dart';
import 'package:module_architecture/data/services/user_service.dart';
import 'package:module_architecture/utils/custom_dialog.dart';

class OpenPostController extends GetxController {
  AccountService accountService;
  UserService userService;
  ForumService forumService;
  OpenPostController({
    required this.accountService,
    required this.userService,
    required this.forumService,
  });

  TextEditingController titleEditingController = TextEditingController();
  TextEditingController createrEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();
  TextEditingController replyEditingController = TextEditingController();

  late Rx<Post> post;

  Rx<bool> get isLiked =>
      Rx(post.value.likeUserId.contains(accountService.myAccount?.id));

  Rx<bool> showSendButton = Rx(false);

  onPressLikeButton() async {
    EasyLoading.show();
    Post? result = await forumService.updateLikePost(
        postId: post.value.id, userId: accountService.myAccount!.id);
    if (result != null) {
      post.update((val) {});
    }
    EasyLoading.dismiss();
  }

  onTapReply(Function showBottomSheet) {
    showBottomSheet();
  }

  onChangedReply() {
    if (replyEditingController.text != '') {
      showSendButton.value = true;
    } else {
      showSendButton.value = false;
    }
  }

  onTapSendReply() async {
    EasyLoading.show();
    Reply reply = Reply(
        createrId: accountService.myAccount!.id,
        content: replyEditingController.value.text,
        createAt: DateTime.now().millisecondsSinceEpoch,
        deleteAt: null,
        likeUserId: [],
        parentId: post.value.id);
    if (await forumService.sendReply(reply)) {
      post.update((val) {});
      replyEditingController.text = '';
      EasyLoading.dismiss();
      Get.back();
    }
  }

  Future<Reply?> getReply(String replyId) async {
    Reply? reply = await forumService.getReply(replyId);
    return reply;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    post = Rx(Get.arguments);
    Account? creater = await userService.getUser(post.value.createrId);
    titleEditingController.text = post.value.title;
    createrEditingController.text = creater!.email!;
    contentEditingController.text = post.value.content;
  }
}
