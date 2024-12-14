import 'package:flutter/material.dart';

class TextUtil {
  static const String fontStyle = 'Lora';

  static double _getScaleFactor(BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio;

    if (dpi <= 1.5) return 0.5; // mdpi và hdpi
    if (dpi <= 2.0) return 0.75; // xhdpi
    if (dpi <= 3.0) return 1.0; // xxhdpi
    return 1.5; // xxxhdpi
  }

  static double getTextSize(BuildContext context, double baseSize) {
    double scaleFactor = _getScaleFactor(context);
    double textScaler = MediaQuery.of(context).textScaler.scale(1.0);
    return baseSize * scaleFactor* textScaler;
  }

  static double smallTextSize(BuildContext context) =>
      getTextSize(context, 14.0);
  static double textSize(BuildContext context) =>
      getTextSize(context, 16.0);
  static double largeTextSize(BuildContext context) =>
      getTextSize(context, 45.0);
}
