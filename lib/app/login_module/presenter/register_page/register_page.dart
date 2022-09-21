import 'package:cambona/cambona.dart';
import 'package:cambona/core/generics_dropdown.dart';
import 'package:cambona/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/register_page/register_controller.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final controller = RegisterController();

  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  DropDownGenerics? selectedCountry;

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
              title: 'Hello',
              subtitle: 'Are You new here?',
              ask: 'if you have an account',
              link: 'Login',
              route: () {
                Navigator.pop(context);
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
                padding: EdgeInsets.symmetric(
                    horizontal: Resposivity.automatic(24, mediaQueryData)),
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
                        prefixIcon: Icons.person,
                      ),
                      const TextTitleWidget(title: 'CPF'),
                      InputTextFieldWidget(
                        label: 'CPF',
                        controller: _cpfController,
                        validator: Validators.validateCPF,
                        prefixIcon: Icons.numbers,
                      ),
                      const TextTitleWidget(title: 'Email'),
                      InputTextFieldWidget(
                        label: 'Email',
                        controller: _emailController,
                        validator: Validators.validateEmail,
                        prefixIcon: Icons.email,
                      ),
                      const TextTitleWidget(title: 'Country'),
                      CustomDropDownWidget(
                        validator: Validators.validateDropDown,
                        data: countries,
                        onChanged: (country) {
                          selectedCountry = country;
                          _phoneController.text = country!.dialCode;
                        },
                        label: 'Country',
                      ),
                      const TextTitleWidget(title: 'Phone'),
                      InputTextFieldWidget(
                        label: 'Phone',
                        controller: _phoneController,
                        validator: Validators.validatePhone,
                        prefixIcon: Icons.phone,
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
                        title: 'Sign Up',
                        onPressed: () {
                          final validate = controller.registerValidate(
                            name: _nameController.text,
                            cpf: _cpfController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            password: _passwordController.text,
                            country: selectedCountry,
                          );
                          if (validate) {
                            Navigator.pop(context);
                          }
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
    );
  }
}
