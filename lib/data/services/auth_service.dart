import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/services/account_service.dart';
import 'package:module_architecture/utils/custom_dialog.dart';
import 'package:module_architecture/utils/log.dart';

class AuthService extends GetxService {
  AccountService accountService;
  AuthService({required this.accountService});

  final _authEvent = Rx<AuthEvent?>(null);

  Stream<AuthEvent?> get authEventStream => _authEvent.stream;

  late String _verificationId;

  int? _forceResendingToken;

  _eraseMyAccount() {
    accountService.me.value = null;
  }

  signInAnonymously() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      accountService.setMyAccount(userCredential);
    } on FirebaseAuthException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
  }

  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    bool result = false;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      accountService.setMyAccount(userCredential);
      result = true;
    } on FirebaseAuthException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  Future<bool> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    bool result = false;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      accountService.setMyAccount(userCredential);
      result = true;
    } on FirebaseAuthException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  Future<bool> verifyCode(String smsCode) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      accountService.setMyAccount(userCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
      return false;
    } catch (e) {
      logError(e);
      return false;
    }
  }

  Future<void> verifyPhone(
      String phone, Function(bool success)? callback) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        forceResendingToken: _forceResendingToken,
        timeout: const Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) {
          if (callback != null) callback(true);
          _authEvent.value = AuthEvent(
              eventType: AuthEventType.VALIDATED, message: 'Completed');
        },
        verificationFailed: (FirebaseAuthException e) {
          _authEvent.value = AuthEvent(
              eventType: AuthEventType.ERROR, message: 'Failed ${e.message}');
          if (callback != null) callback(false);
          CustomDialog.fail(e.message ?? e.code);
        },
        codeSent: (String verificationId, int? resendToken) {
          _forceResendingToken = resendToken;
          _verificationId = verificationId;
          _authEvent.value =
              AuthEvent(eventType: AuthEventType.CODE_SENT, message: 'Sent');
          if (callback != null) callback(true);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _authEvent.value =
              AuthEvent(eventType: AuthEventType.TIMEOUT, message: 'Timeout');
          if (callback != null) callback(false);
        },
      );
    } on FirebaseAuthException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    bool result = false;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      result = true;
    } on FirebaseAuthException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
    } catch (e) {
      logError(e);
    }
    return result;
  }

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _eraseMyAccount();
    } on FirebaseAuthException catch (e) {
      CustomDialog.fail(e.message ?? e.code);
      return false;
    } catch (e) {
      logError(e);
      return false;
    }
  }
}

enum AuthEventType { CODE_SENT, VALIDATED, ERROR, TIMEOUT }

class AuthEvent {
  AuthEventType eventType;
  String? message;
  AuthEvent({required this.eventType, this.message});
}
