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
          // Top decoration with animated slide and fade effect
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: showLogin ? -MediaQuery.of(context).size.height * 0.4 : 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(image: AssetImage('assets/background.png')),
                AnimatedOpacity(
                  opacity: showLogin ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: const CustomText(
                    text: "Welcome",
                    isBold: true,
                  ),
                ),
              ],
            ),
          ),

          // Login form that fades in after the welcome screen is hidden
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: showLogin ? MediaQuery.of(context).size.height * 0.3 : MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: showLogin ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: const LoginForm(),
            ),
          ),

          // "Next" button with fade-out effect
          if (!showLogin)
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedOpacity(
                  opacity: showLogin ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
