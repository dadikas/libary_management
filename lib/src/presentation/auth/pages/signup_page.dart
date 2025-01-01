import 'package:flutter/material.dart';
import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/common/helper/message/display_message.dart';
import 'package:libary_management/src/common/helper/navigation/app_navigation.dart';
import 'package:libary_management/src/core/widget/components/custom_appbar.dart';
import 'package:libary_management/src/core/widget/components/custom_button.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/core/widget/components/custom_textfield.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';
import 'package:libary_management/src/domain/auth/usecases/signup_uscase.dart';
import 'package:libary_management/src/presentation/home/pages/home_page.dart';

import '../../../core/widget/utils/text_util.dart';

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
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.maxWidth;
        return Column(
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
                  CustomTextfield(
                    hintText: 'Name',
                    controller: _nameController,
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CustomTextfield(
                      hintText: 'Email', controller: _emailController),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.04,
                  ),
                  CustomTextfield(
                    hintText: 'Password',
                    controller: _passwordController,
                    icon: Icons.lock,
                    type: 'Password',
                    isObscureText: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04,
                  top: MediaQuery.of(context).size.width * 0.1),
              child: CustomButton(
                title: 'Sign Up',
                width: width,
                height: width * 0.15,
                onPressed: () async => sl<SignupUsecase>().call(
                    params: SignupReqParams(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text)),
                onSuccess: () {
                  AppNavigator.pushAndRemove(context, const HomePage());
                },
                onFailure: (error) {
                  DisplayMessage.showErrorMessage(error, context);
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
