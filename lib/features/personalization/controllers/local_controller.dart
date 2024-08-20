import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  var locale = const Locale('en').obs; // Default locale

  void changeLocale(String langCode) {
    var newLocale = Locale(langCode);
    locale.value = newLocale;
    Get.updateLocale(newLocale);
  }
}
