import 'dart:math';

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    /// Scaffold uchun tasodifiy yorqin ranglar
    scaffoldBackgroundColor: Color.fromARGB(
      255,
      Random().nextInt(180) + 75,
      Random().nextInt(180) + 75,
      Random().nextInt(180) + 75,
    ),

    /// AppBar uchun tasodifiy yorqin ranglar
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(
        255,
        Random().nextInt(180) + 75,
        Random().nextInt(180) + 75,
        Random().nextInt(180) + 75,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    /// Scaffold uchun tasodifiy to'q ranglar
    scaffoldBackgroundColor: Color.fromARGB(
      255,
      Random().nextInt(50),
      Random().nextInt(50),
      Random().nextInt(50),
    ),

    /// AppBar uchun tasodifiy to'q ranglar
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(
        255,
        Random().nextInt(50),
        Random().nextInt(50),
        Random().nextInt(50),
      ),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff454545)),
  );
}
