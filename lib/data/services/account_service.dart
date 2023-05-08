import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/models/account.dart';
import 'package:module_architecture/utils/log.dart';

class AccountService extends GetxService {
  var me = Rx<Account?>(null);
  Account? get myAccount => me.value;

  setMyAccount(UserCredential? userCredential) {
    if (userCredential != null && userCredential.user != null) {
      me.value = Account(
        id: userCredential.user!.uid,
        email: userCredential.user?.email,
        username: userCredential.user?.displayName,
        phone: userCredential.user?.phoneNumber,
      );
      logSuccess(me.value?.id);
    }
  }
}
