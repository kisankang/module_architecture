import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:module_architecture/data/models/account.dart';
import 'package:module_architecture/utils/custom_dialog.dart';
import 'package:module_architecture/utils/log.dart';

class UserRepository extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference get userCollection => _firestore.collection('user');

  Future<bool> createUser(Account user) async {
    bool result = false;
    try {
      await userCollection.doc(user.id).set(user.toJson());
      result = true;
    } on FirebaseException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  Future<Account?> getUser(String userId) async {
    Account? result;
    try {
      await userCollection.doc(userId).get().then((value) {
        Map<String, dynamic> json = value.data() as Map<String, dynamic>;
        Account user = Account.fromJson(json);
        result = user;
      });
    } on FirebaseException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }
}
