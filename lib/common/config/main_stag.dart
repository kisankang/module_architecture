import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:module_architecture/common/config/app_constants.dart';
import 'package:module_architecture/main.dart' as common;

void main() async {
  await dotenv.load(fileName: "assets/staging.env");
  AppConfig config = AppConfig(env: Environment.STAGING, config: {
    BASE_URL: dotenv.env['BASE_URL'],
  });
  Get.put<AppConfig>(config, permanent: true);
  common.main();
}
