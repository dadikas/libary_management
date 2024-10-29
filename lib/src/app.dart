
import 'package:flutter/material.dart';
import 'package:libary_management/src/core/theme/theme.dart';
import 'package:libary_management/src/features/auth/presentation/pages/signin_page.dart';

class LibaryManagementApp extends StatelessWidget{
  const LibaryManagementApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libary Management',
      theme: AppTheme.lightTheme,
      home: const SigninPage(),
    );
  }
}
