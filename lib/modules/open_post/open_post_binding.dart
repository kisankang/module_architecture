import 'package:get/get.dart';
import 'package:module_architecture/modules/open_post/open_post_controller.dart';

class OpenPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenPostController(
          accountService: Get.find(),
          forumService: Get.find(),
          userService: Get.find(),
        ));
  }
}
