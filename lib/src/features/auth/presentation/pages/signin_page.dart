import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/core/widget/components/custom_textfield.dart';
import 'package:libary_management/src/core/widget/utils/text_util.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.width * 0.2),
            child: const CustomText(
              text: 'Welcome \nBack!',
              fontSize: TextUtil.largeTextSize,
              isBold: true,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                const CustomTextfield(title: 'Email', hintText: 'Email'),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                const CustomTextfield(title: 'Password', hintText: 'Password')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: TextButton(
                onPressed: () {},
                child: const CustomText(
                  text: 'Forgot Password?',
                  fontSize: TextUtil.textSize,
                  isBold: true,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50)),
              child: const CustomText(
                text: 'Sign In',
                fontSize: TextUtil.textSize,
                isBold: true,
                textColor: Colors.white,
              ),
              
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(text: 'Don\'t have an account? '),
                TextButton(
                    onPressed: () {},
                    child: const CustomText(
                      text: 'Sign Up',
                      fontSize: TextUtil.textSize,
                      isBold: true,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
