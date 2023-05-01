import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/common/translations/value/st_en_us.dart';
import 'package:module_architecture/common/translations/value/st_ko_kr.dart';

class LocalizationService extends Translations {
  static final locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

  static final langCodes = [
    'en',
    'ko',
  ];

  static const locales = [
    Locale('en', 'US'),
    Locale('ko', 'KR'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'english'.tr,
    'ko': 'korean'.tr,
  });

  static void changeLocale(String? langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ko_KR': koKR,
      };

  static Locale _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale ?? const Locale('en', 'US');
  }
}
