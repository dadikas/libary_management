import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String type;
  final String? hintText;
  final IconData icon;
  final bool isObscureText;
  final Color? textColor;
  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    this.type = 'Email',
    required this.hintText,
    this.icon = Icons.email,
    this.isObscureText = false,
    this.textColor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.onPrimary),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        hintStyle: TextStyle(
            color: textColor ?? Theme.of(context).colorScheme.onSecondary),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: hintText,
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(
            icon,
            color: textColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      obscureText: isObscureText,
      controller: controller,
    );
  }
}
