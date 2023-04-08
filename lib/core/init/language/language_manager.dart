import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';
import 'package:smoking_application/product/enum/languages.dart';

class LanguageManager {
  LanguageManager._init();

  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final trString = "tr";
  final trLocale = const Locale("tr");
  final enLocale = const Locale("en");

  List<Locale> get locals => [trLocale, enLocale];

  Future<void> saveLanguageOption(LanguageOptions option) async {
    await CacheManager.instance
        .setStringValue(SharedKeys.language, option.name);
  }

  String get getLanguageOption =>
      CacheManager.instance.getStringValue(SharedKeys.language) ?? trString;
}
