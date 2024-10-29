import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool showLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top decoration that slides halfway up
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: showLogin ? - MediaQuery.of(context).size.height/2.4 : 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(image: AssetImage('assets/background.png')),
                if (!showLogin)
                  const CustomText(
                    text: "Welcome",
                    isBold: true,
                  ),
              ],
            ),
          ),

          // Login form that slides up to replace the welcome screen
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: showLogin ? MediaQuery.of(context).size.height * 0.3 : MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: const LoginForm(),
          ),

          // "Next" button that disappears after being pressed
          if (!showLogin)
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showLogin = true;
                    });
                  },
                  child: const CustomText(text: "Next"),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(text: "Login", isBold: true, fontSize: 22),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              hintText: "Email",
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const CustomText(text: "Login"),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Forgot Password?", fontSize: 16),
              CustomText(text: "Sign Up", fontSize: 16),
            ],
          ),
        ],
      ),
    );
  }
}
