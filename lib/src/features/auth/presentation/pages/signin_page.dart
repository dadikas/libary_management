import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/core/widget/components/custom_textfield.dart';

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
          _buildWelcomeSection(context),
          _buildLoginForm(context),
          if (!showLogin) _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      top: showLogin ? -MediaQuery.of(context).size.height * 0.4 : 0,
      left: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          AnimatedOpacity(
              opacity: showLogin ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Welcome",
                      fontSize: 32,
                      isBold: true,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: const CustomText(
                        text:
                            "Welcome to the library, the place where you can find your favorite books.",
                        maxLines: 3,
                        isOverFlow: true,
                        textColor: Colors.grey,
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      top: showLogin
          ? MediaQuery.of(context).size.height * 0.15
          : MediaQuery.of(context).size.height,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: showLogin ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: const LoginForm(),
      ),
    );
  }

  Widget _buildNextButton() {
    return Positioned(
      bottom: 10,
      right: 16,
      child: AnimatedOpacity(
        opacity: showLogin ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 500),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              showLogin = true;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: "continue"),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.5, color: Theme.of(context).colorScheme.primary), // Custom underline
                  ),
                ),
                child: CustomText(
                  text: "Sign",
                  isBold: true,
                  fontSize: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              CustomText(
                text: " In",
                isBold: true,
                fontSize: MediaQuery.of(context).size.width * 0.1,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const CustomTextfield(title: "Email", hintText: "Email"),
          const SizedBox(height: 20),
          const CustomTextfield(title: "Password", hintText: "Password", icon: Icons.lock, type: "Password", isObscureText: true,),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: const CustomText(text: "Login"),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
