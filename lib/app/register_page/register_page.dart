import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/app_responsivity.dart';
import 'package:flutter_desafio02_interface/app/register_page/register_controller.dart';
import 'package:flutter_desafio02_interface/app/share/validators/validators.dart';
import 'package:flutter_desafio02_interface/app/share/widgets/confirm_buttom_widget.dart';
import 'package:flutter_desafio02_interface/app/share/widgets/input_text_field_widget.dart';
import 'package:flutter_desafio02_interface/app/share/widgets/text_title_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final controller = RegisterController();

  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Resposivity.automatic(24, mediaQueryData)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: Resposivity.automatic(15, mediaQueryData),
                      ),
                      child: Text(
                        'Hello',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: Resposivity.automatic(30, mediaQueryData),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Are You New Here?',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: Resposivity.automatic(30, mediaQueryData),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Resposivity.automatic(25, mediaQueryData),
                        bottom: Resposivity.automatic(35, mediaQueryData),
                      ),
                      child: Text(
                        'If You Have an Account/Login?',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: Resposivity.automatic(20, mediaQueryData),
                        ),
                      ),
                    ),
                  ],
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
                        //INPUT TEXT FORM FIELD
                        const TextTitleWidget(title: 'Full Name'),
                        InputTextFieldWidget(
                          label: 'Full Name',
                          controller: _nameController,
                          validator: Validators.validateName,
                        ),
                        const TextTitleWidget(title: 'CPF'),
                        InputTextFieldWidget(
                          label: 'CPF',
                          controller: _cpfController,
                          validator: Validators.validateCPF,
                        ),
                        const TextTitleWidget(title: 'Email'),
                        InputTextFieldWidget(
                          label: 'Email',
                          controller: _emailController,
                          validator: Validators.validateEmail,
                        ),
                        const TextTitleWidget(title: 'Password'),
                        InputTextFieldWidget(
                          label: 'Password',
                          controller: _passwordController,
                          validator: Validators.validatePassword,
                          obscure: true,
                          actionIcon: true,
                        ),
                        //REGISTER BUTTON
                        ConfirmButtonWidget(
                          title: 'Sign Up',
                          onPressed: () {
                            print('onPressed');
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
