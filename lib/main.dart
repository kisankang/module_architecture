import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:module_architecture/common/theme/app_theme.dart';
import 'package:module_architecture/common/translations/localization_service.dart';
import 'package:module_architecture/data/services/theme_service.dart';
import 'package:module_architecture/routes/app_pages.dart';
import 'package:module_architecture/utils/scroll_behavior.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Get.put<ThemeService>(ThemeService(), permanent: true);

  var getMaterialApp = GetMaterialApp(
    themeMode: ThemeService().getThemeMode(),
    // supportedLocales: [
    //   Locale('en', 'US'),
    //   Locale('vi', 'VN'),
    // ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    ],
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ko', 'KR'),
    ],
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    localeResolutionCallback: (locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale?.languageCode &&
            supportedLocale.countryCode == locale?.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    getPages: AppPages.pages,
    initialRoute: Routes.SPLASH,
    initialBinding: BindingsBuilder(() {}),
    builder: EasyLoading.init(
      builder: (context, child) => ScrollConfiguration(
        behavior: DisableGlowBehavior(),
        child: child!,
      ),
    ),
  );
  runApp(getMaterialApp);
}
