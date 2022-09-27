import 'package:cambona/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/navigation/app_navigator.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/login_page/login_page.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/profile_page/profile_page.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/register_page/register_page.dart';
import 'package:flutter_desafio02_interface/app/share/snake_bar_manager/snake_bar_manager.dart';
import 'package:flutter_desafio02_interface/app/splash_page/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio 02',
      theme: themeDataNormal,
      navigatorKey: AppNavigator.navigatorKey,
      scaffoldMessengerKey: SnackBarManager.snackKey,
      //home: const SplashPage(),
      initialRoute: AppNavigator.SPLASH,
      routes: {
        AppNavigator.SPLASH: (context) => const SplashPage(),
        AppNavigator.LOGIN: (context) => LoginPage(),
        AppNavigator.REGISTER: (context) => RegisterPage(),
        AppNavigator.PROFILE: (context) => const ProfilePage(),
      },
    );
  }
}
