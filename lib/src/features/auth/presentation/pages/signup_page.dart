import 'package:flutter/material.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/core/widget/components/custom_textfield.dart';

import '../../../../core/widget/utils/text_util.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
            child: CustomText(
              text: 'Sign Up',
              fontSize: TextUtil.largeTextSize(context),
              isBold: true,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Column(
              children: [
                CustomTextfield(title: 'Name', hintText: 'Name', controller: _nameController),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                CustomTextfield(title: 'Email', hintText: 'Email', controller: _emailController),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                CustomTextfield(title: 'Password', hintText: 'Password', controller: _passwordController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //forgot password
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: 'Forgot Password?',
                          fontSize: TextUtil.textSize(context),
                          isBold: true,
                        )),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04),
            child: ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50)),
              child: CustomText(
                text: 'Sign Up',
                fontSize: TextUtil.textSize(context),
                isBold: true,
                textColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
