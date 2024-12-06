
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libary_management/src/core/theme/theme.dart';
import 'package:libary_management/src/features/splash/pages/splash_page.dart';

class LibaryManagementApp extends StatelessWidget{
  const LibaryManagementApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libary Management',
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
