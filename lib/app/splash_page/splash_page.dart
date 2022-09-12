import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/app_responsivity.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/login_page/login_page.dart';
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

    Future.delayed(const Duration(seconds: 2)).then((_) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black12,
      resizeToAvoidBottomInset: true,
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            'Welcome',
            style: TextStyle(
              fontSize: Resposivity.automatic(40, mediaQueryData),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
