import 'package:flutter/material.dart';
import 'package:libary_management/src/common/helper/message/display_message.dart';
import 'package:libary_management/src/common/helper/navigation/app_navigation.dart';
import 'package:libary_management/src/core/widget/components/custom_appbar.dart';
import 'package:libary_management/src/core/widget/components/custom_button.dart';
import 'package:libary_management/src/core/widget/components/custom_text.dart';
import 'package:libary_management/src/core/widget/components/custom_textfield.dart';
import 'package:libary_management/src/core/widget/utils/text_util.dart';
import 'package:libary_management/src/presentation/auth/pages/signin_page.dart';

class ForgotpasswordPage extends StatefulWidget {
  const ForgotpasswordPage({super.key});

  @override
  State<ForgotpasswordPage> createState() => _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _retypePasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
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
              text: 'Forgot Password',
              fontSize: TextUtil.largeTextSize(context),
              isBold: true,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                CustomTextfield(hintText: 'Email', controller: _emailController),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                CustomTextfield( hintText: 'Password', controller: _passwordController, icon: Icons.lock, type: 'Password', isObscureText: true,),
                 SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                CustomTextfield( hintText: 'Retype Password', controller: _retypePasswordController, icon: Icons.lock, type: 'Password', isObscureText: true,),
                
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,  
                top: MediaQuery.of(context).size.width * 0.1),
            child:  CustomButton(
                title: 'Change Password',
                width: width,
                height: width * 0.15,
                onPressed: ()async => {},
                onSuccess: () {
                  AppNavigator.pushAndRemove(context, const SigninPage());
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