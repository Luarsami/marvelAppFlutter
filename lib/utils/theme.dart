import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData themeData = ThemeData(
      fontFamily: 'Raleway',
      drawerTheme:
          const DrawerThemeData(backgroundColor: Colors.white, width: 150),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.red),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 22,
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          )));
}
