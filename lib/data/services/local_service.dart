import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:module_architecture/common/config/app_storage_key.dart';

class LocalService extends GetxService {
  GetStorage? _userStorage;
  GetStorage? _appStorage;

  GetStorage get userStorage {
    _userStorage ??= GetStorage('USER_STORE');
    return _userStorage!;
  }

  GetStorage get appStorage {
    _appStorage ??= GetStorage('APP_STORE');
    return _appStorage!;
  }

  Future get init => userStorage.initStorage;

  Future cacheEnvironment(String env) {
    return appStorage.write(StorageKey.ENV, env);
  }

  Future cacheToken(String token) {
    return userStorage.write(StorageKey.TOKEN, token);
  }

  Future cacheId(String id) {
    return userStorage.write(StorageKey.ID, id);
  }

  Future cacheUuid(String? callerId) {
    return userStorage.write(StorageKey.UUID, callerId);
  }

  bool isFistTimeUse() {
    final val = appStorage.read(StorageKey.FIRST_TIME_USE) == null ||
        appStorage.read(StorageKey.FIRST_TIME_USE) == 'true' ||
        appStorage.read(StorageKey.FIRST_TIME_USE) == true;
    return val;
  }

  Future setFirstTimeUse(bool isFirst) {
    return appStorage.write(StorageKey.FIRST_TIME_USE, isFirst);
  }

  String read(String key) => userStorage.read(key);

  Future write(String key, String value) {
    return userStorage.write(key, value);
  }

  bool has(String key) => userStorage.hasData(key);

  String? get env => appStorage.read(StorageKey.ENV);

  String? get token => userStorage.read(StorageKey.TOKEN);

  String? get id => userStorage.read(StorageKey.ID);

  String? get uuid => userStorage.read(StorageKey.UUID);

  clearUuid() => userStorage.remove(StorageKey.UUID);

  clear() async => userStorage.erase();
}
