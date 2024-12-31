import 'package:flutter/material.dart';
import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/common/helper/message/display_message.dart';
import 'package:libary_management/src/common/helper/navigation/app_navigation.dart';
import 'package:libary_management/src/core/widget/components/custom_button.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/core/widget/components/custom_textfield.dart';
import 'package:libary_management/src/core/widget/utils/text_util.dart';
import 'package:libary_management/src/data/auth/models/signin_req_params.dart';
import 'package:libary_management/src/domain/auth/usecases/signin_usecase.dart';
import 'package:libary_management/src/features/auth/presentation/pages/signup_page.dart';
import 'package:libary_management/src/features/home/pages/home_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    CustomTextfield(
                        hintText: 'Email',
                        controller: _emailController),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    CustomTextfield(
                        hintText: 'Password',
                        controller: _passwordController,
                        icon: Icons.lock,
                        type: 'Password',
                        isObscureText: true,),
                        
                  ],
                ),
              ),
              TextButton(
                  onPressed: () async => sl<SigninUscase>().call(
                      params: SigninReqParams(
                          email: _emailController.text,
                          password: _passwordController.text)),
                  child: CustomText(
                    text: 'Forgot Password?',
                    fontSize: TextUtil.textSize(context),
                    isBold: true,
                  )),
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: CustomButton(
                  title: 'Sign In',
                  width: width,
                  height: width * 0.15,
                  onPressed: () async => sl<SigninUscase>().call(
                      params: SigninReqParams(
                          email: _emailController.text,
                          password: _passwordController.text)),
                  onSuccess: () {
                    AppNavigator.pushAndRemove(context, const HomePage());
                  },
                  onFailure: (error) {
                    DisplayMessage.showErrorMessage(error, context);
                  },
                  
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
