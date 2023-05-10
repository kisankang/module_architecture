import 'package:get/get.dart';
import 'package:module_architecture/modules/create_post/create_post_controller.dart';

class CreatePostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePostController(
          accountService: Get.find(),
          forumService: Get.find(),
        ));
  }
}
