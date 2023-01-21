// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';
import '../../../product/enum/app_themes.dart';
import '../theme/themes/dark_theme.dart';
import '../theme/themes/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  Map<String, ThemeData> themeList = {
    "LightTheme": LightThemeData.instance.theme,
    "DarkTheme": DarkThemeData.instance.theme,
  };

  late ThemeData _currentTheme;

  ThemeData get currentTheme => _currentTheme;

  ThemeNotifier() {
    _currentTheme =
        themeList[CacheManager.instance.getStringValue(SharedKeys.theme)] ??
            LightThemeData.instance.theme;
  }

  void changeTheme(AppThemes theme) {
    if (theme == AppThemes.light) {
      _currentTheme = LightThemeData.instance.theme;
      CacheManager.instance.setStringValue(SharedKeys.theme, "LightTheme");
    } else {
      _currentTheme = DarkThemeData.instance.theme;
      CacheManager.instance.setStringValue(SharedKeys.theme, "DarkTheme");
    }
    notifyListeners();
  }
}
