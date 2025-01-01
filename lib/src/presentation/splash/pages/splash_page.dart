// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libary_management/src/common/helper/navigation/app_navigation.dart';
import 'package:libary_management/src/presentation/auth/pages/introduction_page.dart';
import 'package:libary_management/src/presentation/auth/pages/signin_page.dart';
import 'package:libary_management/src/presentation/home/pages/home_page.dart';
import 'package:libary_management/src/presentation/splash/bloc/splash_bloc.dart';
import 'package:libary_management/src/presentation/splash/bloc/splash_event.dart';
import 'package:libary_management/src/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(SplashStarted()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is TheFistYouOpenApp) {
            AppNavigator.pushReplacement(context, const IntroductionPage());
          } else if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());
          } else if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, const SigninPage());
          }
        },
        child: const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/Logo.png')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
