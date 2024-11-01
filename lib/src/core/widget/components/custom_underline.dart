import 'package:flutter/material.dart';

class CustomUnderline extends StatelessWidget {
  final bool isfullWidth;
  final double height;
  final Color color;

  const CustomUnderline({
    super.key,
    this.isfullWidth = false,
    this.height = 1,
    this.color = Colors.grey
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
       height: height,
        thickness: 2,
        indent: isfullWidth ? 0 : 40,
        endIndent: isfullWidth ? 0 : 35,
        color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}