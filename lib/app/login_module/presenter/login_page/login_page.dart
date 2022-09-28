import 'package:cambona/cambona.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/navigation/app_navigator.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/login_page/login_controller.dart';
import 'package:flutter_desafio02_interface/app/share/validators/validators.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final controller = LoginController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: ListView(
          children: [
            WelcomeWidget(
              title: Text(
                '👋 Hello',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Are You new here?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ask: RichText(
                text: TextSpan(
                  style: themeData.textTheme.titleMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'If you have an account ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextSpan(
                      text: ' | Register',
                      style: themeData.textTheme.titleMedium,
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() => AppNavigator.go(
                              AppNavigator.REGISTER,
                            )),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              constraints: BoxConstraints(
                minHeight: Responsivity.automatic(628, mediaQueryData),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsivity.automatic(24, mediaQueryData),
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextTitleWidget(
                        title: Text(
                          'Email',
                          style: themeData.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('Email'),
                        controller: _emailController,
                        validator: Validators.validateEmail,
                        prefixIcon: Icons.person,
                      ),
                      TextTitleWidget(
                        title: Text(
                          'Password',
                          style: themeData.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldPasswordWidget(
                        label: const Text('Password'),
                        controller: _passwordController,
                        validator: Validators.validatePassword,
                        obscure: true,
                        suffixIcon: true,
                        prefixIcon: Icons.password,
                      ),
                      ConfirmButtonWidget(
                        title: 'Sign In',
                        onPressed: () {
                          controller.loginValidate(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
