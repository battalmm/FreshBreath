import 'package:flutter/material.dart';
import 'package:smoking_application/core/init/theme/theme.dart';

class LightThemeData extends ICustomThemeData {
  LightThemeData._();
  static final LightThemeData _instance = LightThemeData._();
  static LightThemeData get instance => _instance;

  Color fishBoy = const Color(0xFF1BD5DD);

  Color white = Colors.white;

  Color backgroundColor = Colors.grey.shade200;

  Color dark = Colors.black;

  Color grey = Colors.grey;

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        backgroundColor: Colors.grey.shade100,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15.0),
          ),
          filled: true,
          fillColor: Colors.grey.shade300,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.blue,
        ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 34,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 55),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: fishBoy,
          onPrimary: white,
          secondary: fishBoy,
          onSecondary: white,
          error: fishBoy,
          onError: fishBoy,
          background: backgroundColor,
          onBackground: grey,
          surface: dark,
          onSurface: fishBoy,
        ),
        iconTheme: IconThemeData(color: fishBoy),
        scaffoldBackgroundColor: Colors.grey.shade200,
        canvasColor: backgroundColor,
      );
}
