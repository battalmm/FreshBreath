import 'package:flutter/material.dart';
import 'package:smoking_application/core/init/theme/theme.dart';

class DarkThemeData extends ICustomThemeData {
  DarkThemeData._();
  static final DarkThemeData _instance = DarkThemeData._();
  static DarkThemeData get instance => _instance;

  Color orange = Colors.orange;

  Color white = Colors.white;

  Color whiteGrey = Colors.grey.shade300;

  Color dark = Colors.grey.shade800;

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: orange),
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: orange),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: white,
            fontSize: 34,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 5),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: orange,
        onPrimary: white,
        secondary: orange,
        onSecondary: white,
        error: orange,
        onError: white,
        background: dark,
        onBackground: whiteGrey,
        surface: orange,
        onSurface: dark,
      ),
      iconTheme: IconThemeData(color: orange),
      canvasColor: Colors.grey.shade200,
      scaffoldBackgroundColor: dark);
}
