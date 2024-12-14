import 'package:flutter/material.dart';
import 'package:libary_management/src/common/helper/navigation/app_navigation.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/core/widget/components/custom_textfield.dart';
import 'package:libary_management/src/core/widget/utils/text_util.dart';
import 'package:libary_management/src/features/auth/presentation/pages/signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: width * 0.05, top: width * 0.2),
                child: CustomText(
                  text: 'Sign In',
                  fontSize: TextUtil.largeTextSize(context),
                  isBold: true,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Column(
                  children: [
                    const CustomTextfield(title: 'Email', hintText: 'Email'),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    const CustomTextfield(
                        title: 'Password', hintText: 'Password')
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'Forgot Password?',
                    fontSize: TextUtil.textSize(context),
                    isBold: true,
                  )),
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize:
                          Size(width, 50)),
                  child: CustomText(
                    text: 'Sign In',
                    fontSize: TextUtil.textSize(context),
                    isBold: true,
                    textColor: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const CustomText(
                      text: 'Don\'t have an account? ',
                    ),
                    TextButton(
                      onPressed: () {
                        AppNavigator.push(context, const SignupPage());
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: CustomText(
                        text: 'Sign Up',
                        fontSize: TextUtil.textSize(context),
                        isBold: true,
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
