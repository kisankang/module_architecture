import 'package:get/get.dart';
import 'package:module_architecture/data/models/account.dart';
import 'package:module_architecture/data/repositories/user_repository.dart';

class UserService extends GetxService {
  final UserRepository _userRepository;
  UserService({required UserRepository userRepository})
      : _userRepository = userRepository;

  Rx<Map<String, Account>?> users = Rx(null);

  Future<bool> createUser(Account user) async {
    bool result = false;
    if (await _userRepository.createUser(user)) {
      users.value ??= {};
      users.update((val) {
        val!.addAll({user.id: user});
      });
      result = true;
    }
    return result;
  }

  Future<Account?> getUser(String userId) async {
    Account? user;
    if (users.value?[userId] != null) {
      user = users.value?[userId];
    } else {
      users.value ??= {};
      Account? _user = await _userRepository.getUser(userId);
      if (_user != null) {
        users.update((val) {
          val!.addAll({userId: _user});
        });
      }
      user = users.value?[userId];
    }
    return user;
  }
}
