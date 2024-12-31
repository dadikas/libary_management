
import 'package:flutter/material.dart';

class AppTheme{
    static final lightTheme = lightGreenMode;
    static final darkTheme = darkGreenMode;
}
ThemeData lightGreenMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        surface: Colors.white,
        primary: Color.fromRGBO(0, 0, 0, 1),
        secondary: Color.fromRGBO(215, 216, 216, 1),
        onSurface: Colors.white,
        onPrimary: Color.fromARGB(255, 0, 0, 0),
        onSecondary: Color.fromRGBO(90, 89, 89, 1)

    )
);
ThemeData darkGreenMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        surface: Color.fromRGBO(60,124, 109, 1),
        primary: Color.fromRGBO(96,175,155, 1),
        secondary: Color.fromRGBO(31,76,59, 1),
        onSurface: Colors.white24,
        onPrimary: Colors.white,
        onSecondary: Color.fromRGBO(31, 76, 59, 1)

    )
);