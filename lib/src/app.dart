import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libary_management/src/core/theme/theme.dart';
import 'package:libary_management/src/presentation/home/pages/main_page.dart';
import 'package:libary_management/src/presentation/splash/bloc/splash_bloc.dart';
// import 'package:libary_management/src/presentation/splash/pages/splash_page.dart';

class LibaryManagementApp extends StatelessWidget {
  const LibaryManagementApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Libary Management',
        theme: AppTheme.lightTheme,
        home: const MainPage(contentBody: MainScreenIndex.home,),
      ),
    );
  }
}
