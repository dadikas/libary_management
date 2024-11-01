import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';

class CustomTextfield extends StatelessWidget {
  final String title;
  final String type;
  final String hintText;
  final IconData icon;
  final bool isObscureText;

  const CustomTextfield({
    super.key,
    required this.title,
    this.type = 'Email',
    required this.hintText,
    this.icon = Icons.email,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: title, isBold: true),
          TextField(
              decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: const OutlineInputBorder(),
            labelText: hintText,
            prefixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(
                icon,
              ),
            ),
          ))
        ],
      );

  }
}
