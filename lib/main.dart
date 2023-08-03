import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'common/theme/app_theme.dart';
import 'routes/app_pages.dart';
import 'utils/scroll_behavior.dart';

void main() {
  var getMaterialApp = GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.theme,
    getPages: AppPages.pages,
    initialRoute: Routes.MAIN,
    initialBinding: BindingsBuilder(() {}),
    builder: EasyLoading.init(
      builder: (context, child) => ScrollConfiguration(
        behavior: DisableGlowBehavior(),
        child: child!,
      ),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(getMaterialApp);
}
