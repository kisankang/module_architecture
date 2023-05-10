import 'package:get/get.dart';
import 'package:module_architecture/modules/forum/forum_controller.dart';
import 'package:module_architecture/modules/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForumController(forumService: Get.find()));
    Get.lazyPut(() => MainController());
  }
}
