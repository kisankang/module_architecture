import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/models/reply.dart';
import 'package:module_architecture/modules/open_post/open_post_controller.dart';
import 'package:module_architecture/utils/dateTimeFormatter.dart';
import 'package:module_architecture/widgets/user_label.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class OpenPostPage extends GetWidget<OpenPostController> {
  const OpenPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Open post'),
        ),
        body: Padding(
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
                enabled: false,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.createrEditingController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'writer',
                  border: OutlineInputBorder(),
                ),
                enabled: false,
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
                  enabled: false,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => TextButton.icon(
                      onPressed: controller.onPressLikeButton,
                      icon: controller.isLiked.value
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_outline),
                      label: Text(
                        controller.post.value.likeUserId.length.toString(),
                      ),
                    ),
                  ),
                  Obx(
                    () => TextButton.icon(
                      onPressed: () => controller.onTapReply(showBottomSheet),
                      icon: const Icon(Icons.chat_outlined),
                      label:
                          Text(controller.post.value.replies.length.toString()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet() => showModalBottomSheet(
      context: Get.context!,
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            bottom: 30 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.post.value.replies.length,
                  itemBuilder: ((context, index) => FutureBuilder(
                      future: controller
                          .getReply(controller.post.value.replies[index]),
                      builder: (context, asyncSnapshot) {
                        if (asyncSnapshot.connectionState !=
                            ConnectionState.done) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          if (asyncSnapshot.data == null) {
                            return const Center(
                                child: Icon(Icons.do_not_disturb));
                          } else {
                            Reply? reply = asyncSnapshot.data;
                            return ListTile(
                              leading: Text(
                                  DateTimeFormatter.fromMillisecondsSinceEpoch(
                                      reply!.createAt)),
                              title: Text(reply.content),
                              trailing: UserLabel(userId: reply.createrId),
                            );
                          }
                        }
                      })),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.replyEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'reply',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        controller.onChangedReply();
                      },
                    ),
                  ),
                  Obx(
                    () => controller.showSendButton.value
                        ? IconButton(
                            onPressed: controller.onTapSendReply,
                            icon: const Icon(Icons.send),
                          )
                        : const SizedBox(width: 20),
                  )
                ],
              ),
            ],
          ),
        );
      });
}
