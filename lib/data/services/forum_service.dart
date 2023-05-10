import 'package:get/get.dart';
import 'package:module_architecture/data/models/post.dart';
import 'package:module_architecture/data/models/reply.dart';
import 'package:module_architecture/data/repositories/forum_repository.dart';

const int _limit = 2;

class ForumService extends GetxService {
  final ForumRepository _firebaseRepository;
  ForumService({required ForumRepository firebaseRepository})
      : _firebaseRepository = firebaseRepository;

  Rx<List<Post>?> posts = Rx(null);
  Rx<Map<String, Reply>?> replies = Rx(null);

  Rx<bool> isLoadingOldData = Rx(false);
  Rx<bool> isNoMoreOldData = Rx(false);

  _addPosts({required bool isRecentData, required List<Post> postList}) {
    posts.value ??= [];
    if (isRecentData) {
      posts.update((val) {
        val?.insertAll(0, postList);
      });
    } else {
      posts.update((val) {
        val!.addAll(postList);
      });
    }
  }

  _updateLikePost(
      {required int documentIndex,
      required bool isAdd,
      required String userId}) {
    posts.update((val) {
      if (isAdd) {
        val![documentIndex].likeUserId.add(userId);
      } else {
        val![documentIndex].likeUserId.remove(userId);
      }
    });
  }

  _addReplies({required Reply reply}) {
    replies.value ??= {};
    replies.update((val) {
      val?.addAll({reply.id: reply});
    });
    int index =
        posts.value!.indexWhere((element) => element.id == reply.parentId);
    posts.update((val) {
      val?[index].replies.add(reply.id);
    });
  }

  Future<bool> createPost(Post post) async {
    bool result = false;
    if (await _firebaseRepository.createPost(post)) {
      result = true;
    }
    return result;
  }

  Future<bool> getPosts({
    bool isFindingRecentData = true,
    int? referencePostId,
  }) async {
    bool result = false;
    if (!isFindingRecentData) {
      isLoadingOldData.value = true;
    }
    List<Post> _posts = await _firebaseRepository.getPosts(
      isFindingRecentData: isFindingRecentData,
      referencePostId: referencePostId,
      limit: _limit,
    );

    if (_posts.isNotEmpty) {
      if (isFindingRecentData) {
        _addPosts(isRecentData: true, postList: _posts);
      } else {
        _addPosts(isRecentData: false, postList: _posts);
      }
      result = true;
    }
    if (!isFindingRecentData) {
      isLoadingOldData.value = false;
      isNoMoreOldData.value = _limit > _posts.length;
    }
    return result;
  }

  Future<Post?> updateLikePost(
      {required String postId, required String userId}) async {
    Post? result;
    int index = posts.value!.indexWhere((element) => element.id == postId);
    bool isAdd = !posts.value![index].likeUserId.contains(userId);
    if (await _firebaseRepository.updateLikePost(
        postId: postId, userId: userId, isAdd: isAdd)) {
      _updateLikePost(documentIndex: index, isAdd: isAdd, userId: userId);
      result = posts.value?[index];
    }
    return result;
  }

  Future<bool> sendReply(Reply reply) async {
    bool result = false;
    if (await _firebaseRepository.sendReply(reply: reply)) {
      _addReplies(reply: reply);
      result = true;
    }
    return result;
  }

  Future<Reply?> getReply(String replyId) async {
    Reply? reply;
    if (replies.value?[replyId] != null) {
      reply = replies.value?[replyId];
    } else {
      replies.value ??= {};
      Reply? _reply = await _firebaseRepository.getReply(replyId);
      if (_reply != null) {
        replies.update((val) {
          val!.addAll({replyId: _reply});
        });
      }

      reply = replies.value?[replyId];
    }
    return reply;
  }
}
