import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';

class DisplayMessage {
  static showErrorMessage(String message, BuildContext context) {
    var snackBar = SnackBar(content: CustomText(text: message, isBold: true), behavior: SnackBarBehavior.floating,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}