import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/share/snake_bar_manager/snake_bar_manager.dart';
import 'package:flutter_desafio02_interface/app/splash_page/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio 02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple[400],
          ),
        ),
      ),
      scaffoldMessengerKey: SnackBarManager.snackKey,
      home: const SplashPage(),
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
