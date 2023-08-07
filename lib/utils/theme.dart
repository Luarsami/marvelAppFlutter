import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData themeData = ThemeData(
      fontFamily: 'Raleway',
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
