import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/models/post.dart';
import 'package:module_architecture/modules/forum/forum_controller.dart';
import 'package:module_architecture/utils/dateTimeFormatter.dart';
import 'package:module_architecture/widgets/user_label.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class ForumPage extends GetWidget<ForumController> {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapPage(
      child: Scaffold(
        body: Obx(() => RefreshIndicator(
              onRefresh: controller.onLoadMoreRecent,
              child: controller.forumService.posts.value == null
                  ? const Center(child: CircularProgressIndicator())
                  : controller.forumService.posts.value!.isEmpty
                      ? const Text('no data')
                      : ListView.builder(
                          itemCount:
                              controller.forumService.posts.value!.length + 1,
                          itemBuilder: (context, i) {
                            if (i ==
                                controller.forumService.posts.value!.length) {
                              return Obx(() => controller
                                      .forumService.isLoadingOldData.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Visibility(
                                      visible: !controller
                                          .forumService.isNoMoreOldData.value,
                                      child: OutlinedButton(
                                          onPressed: controller.onLoadMoreOld,
                                          child: const Text('load more')),
                                    ));
                            } else {
                              Post post =
                                  controller.forumService.posts.value![i];
                              String date =
                                  DateTimeFormatter.fromMillisecondsSinceEpoch(
                                      post.createAt);
                              return GestureDetector(
                                onTap: () => controller.onTapItem(post),
                                child: ListTile(
                                  leading: Text(date),
                                  title: Text(post.title),
                                  subtitle: Text(
                                    post.content,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: UserLabel(userId: post.createrId),
                                ),
                              );
                            }
                          },
                        ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.onPressCreateButton,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
