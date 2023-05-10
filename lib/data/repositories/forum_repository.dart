import 'dart:math';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:module_architecture/data/models/post.dart';
import 'package:module_architecture/data/models/reply.dart';
import 'package:module_architecture/utils/custom_dialog.dart';
import 'package:module_architecture/utils/log.dart';

class ForumRepository extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference get postCollection => _firestore.collection('post');
  CollectionReference get replyCollection => _firestore.collection('reply');

  Future<bool> createPost(Post post) async {
    bool result = false;
    try {
      await postCollection.doc(post.id).set(post.toJson());
      result = true;
    } on FirebaseException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  Future<List<Post>> getPosts({
    required bool isFindingRecentData,
    int? referencePostId,
    required int limit,
  }) async {
    List<Post> result = [];
    try {
      Query<Object?> query =
          postCollection.orderBy('createAt', descending: true);
      if (isFindingRecentData) {
        if (referencePostId == null) {
          query = query
              .where('createAt', isGreaterThan: referencePostId)
              .limit(limit);
        } else {
          query = query
              .where('createAt', isGreaterThan: referencePostId)
              .limitToLast(limit);
        }
      } else {
        query =
            query.where('createAt', isLessThan: referencePostId).limit(limit);
      }
      await query.get().then((value) {
        for (var element in value.docs) {
          Map<String, dynamic> json = element.data() as Map<String, dynamic>;
          result.add(Post.fromJson(json));
        }
      });
    } on FirebaseException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  Future<bool> updateLikePost({
    required String postId,
    required String userId,
    required bool isAdd,
  }) async {
    bool result = false;
    try {
      if (isAdd) {
        await postCollection.doc(postId).update({
          'likeUserId': FieldValue.arrayUnion([userId])
        });
      } else {
        await postCollection.doc(postId).update({
          'likeUserId': FieldValue.arrayRemove([userId])
        });
      }
      result = true;
    } on FirebaseException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  Future<bool> sendReply({required Reply reply}) async {
    bool result = false;
    try {
      await replyCollection.doc(reply.id).set(reply.toJson());
      await postCollection.doc(reply.parentId).update({
        'replies': FieldValue.arrayUnion([reply.id])
      });
      result = true;
    } on FirebaseException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  Future<Reply?> getReply(String replyId) async {
    Reply? reply;
    try {
      await replyCollection.doc(replyId).get().then((value) {
        Map<String, dynamic> json = value.data() as Map<String, dynamic>;
        reply = Reply.fromJson(json);
      });
    } on FirebaseException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }

    return reply;
  }
}
