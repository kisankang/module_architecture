import 'package:get/get.dart';
import 'package:module_architecture/data/models/post.dart';
import 'package:module_architecture/data/services/forum_service.dart';
import 'package:module_architecture/routes/app_pages.dart';

class ForumController extends GetxController {
  final ForumService forumService;
  ForumController({required this.forumService});
  _goToCreatePostPage() => Get.toNamed(Routes.CREATEPOST);

  onPressCreateButton() => _goToCreatePostPage();

  Future<void> getInitialData() async {
    await forumService.getPosts();
  }

  Future<void> onLoadMoreRecent() async {
    await forumService.getPosts(
        referencePostId: forumService.posts.value?.first.createAt);
  }

  Future onLoadMoreOld() async {
    await forumService.getPosts(
        isFindingRecentData: false,
        referencePostId: forumService.posts.value?.last.createAt);
  }

  onTapItem(Post post) {
    Get.toNamed(Routes.OPENPOST, arguments: post);
  }

  @override
  void onInit() {
    super.onInit();
    getInitialData();
  }
}
