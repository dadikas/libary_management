import 'dart:async';
import 'package:flutter/material.dart';
import 'package:libary_management/src/features/auth/presentation/pages/introduction_page.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
   @override
  void initState() {
    super.initState();
    _navigateToSignIn();
  }
   void _navigateToSignIn() async {
    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check if the widget is still mounted before navigating
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroductionPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/Logo.png')),
      ),
    );
  }
}