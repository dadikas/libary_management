
import 'package:flutter/material.dart';

class AppTheme{
    static final lightTheme = lightGreenMode;
}
ThemeData lightGreenMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        surface: Color.fromRGBO(231,248, 247, 1),
        primary: Color.fromRGBO(61,107,106, 1),
        secondary: Color.fromRGBO(79,140,132, 1),
        onSurface: Colors.white,
        onPrimary: Colors.black,
        onSecondary: Color.fromRGBO(161, 226, 222, 1)

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