import 'package:get/get.dart';
import 'package:module_architecture/modules/forum/forum_controller.dart';

class ForumBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForumController(forumService: Get.find()));
  }
}
