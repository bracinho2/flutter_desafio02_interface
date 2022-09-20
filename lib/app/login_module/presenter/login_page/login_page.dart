import 'package:cambona/widgets/confirm_buttom_widget.dart';
import 'package:cambona/widgets/input_text_field_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:cambona/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/app_responsivity.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/login_page/login_controller.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/profile_page/profile_page.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/register_page/register_page.dart';
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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              WelcomeWidget(
                title: 'Hello',
                subtitle: 'Are You new here?',
                ask: 'Dont have an account?',
                link: 'Register',
                route: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
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
                  minHeight: Resposivity.automatic(628, mediaQueryData),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const TextTitleWidget(title: 'Email'),
                        InputTextFieldWidget(
                          label: 'Email',
                          controller: _emailController,
                          validator: Validators.validateEmail,
                          prefixIcon: Icons.person,
                        ),
                        const TextTitleWidget(title: 'Password'),
                        InputTextFieldWidget(
                          label: 'Password',
                          controller: _passwordController,
                          validator: Validators.validatePassword,
                          obscure: true,
                          actionIcon: true,
                          prefixIcon: Icons.password,
                        ),
                        //REGISTER BUTTON
                        ConfirmButtonWidget(
                          title: 'Sign In',
                          onPressed: () {
                            // final validate = controller.loginValidate(
                            //   email: _emailController.text,
                            //   password: _passwordController.text,
                            // );

                            // if (_emailController.text.isEmpty &&
                            //     _passwordController.text.isEmpty) {
                            // } else {
                            //   if (validate) {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: ((context) => ProfilePage())));
                            //   } else {
                            //     SnackBarManager().showError(
                            //         message: 'Email or Password Wrong');
                            //   }
                            // }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ProfilePage())));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
