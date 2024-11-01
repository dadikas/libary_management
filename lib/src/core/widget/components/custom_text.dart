import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/utils/text_util.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool isBold;
  final bool isItalic;
  final bool isCenter;
  final double fontSize;
  final bool isOverFlow;
  final Color? textColor;
  final bool softWrap;
  final int maxLines;
  final bool isUnderline;
  const CustomText(
      {super.key,
      required this.text,
      this.isBold = false,
      this.isItalic = false,
      this.isCenter = false,
      this.fontSize = TextUtil.textSize,
      this.isOverFlow = false,
      this.softWrap = true,
      this.textColor,
      this.maxLines = 1,
      this.isUnderline = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: isOverFlow ? TextOverflow.visible : null,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        color: textColor ?? Theme.of(context).colorScheme.onPrimary,
      ),
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      softWrap: softWrap,
      maxLines: maxLines,
    );
  }
}
