import 'dart:ui';

import 'package:get/get.dart';
import 'package:slots_132/i18nnn/en_US.dart';


class TranslationI18 extends Translations {
  static Locale? get locale => Get.deviceLocale;
  // static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en_US,
  };
}