import 'package:cambona/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/profile_page/profile_page.dart';
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
      scaffoldMessengerKey: SnackBarManager.snackKey,
      home: ProfilePage(),
      // initialRoute: '/',
      // routes: {
      //   AppRouter.SPLASH: (_) => const SplashPage(),
      //   AppRouter.LOGIN: (_) => LoginPage(),
      //   AppRouter.REGISTER: (_) => RegisterPage(),
      //   AppRouter.PROFILE: (_) => ProfilePage(),
      // },
    );
  }
}
