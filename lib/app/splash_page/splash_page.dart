import 'package:cambona/cambona.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/navigation/app_navigator.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/register_page/register_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = RegisterController();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then(
      (_) => AppNavigator.goReplacement(
        AppNavigator.LOGIN,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Align(
        alignment: Alignment.center,
        child: Text(
          'Welcome',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
