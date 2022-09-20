import 'package:cambona/core/generics_dropdown.dart';
import 'package:cambona/dummy/contries.dart';
import 'package:cambona/widgets/confirm_buttom_widget.dart';
import 'package:cambona/widgets/drop_down_menu.dart';
import 'package:cambona/widgets/input_text_field_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:cambona/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/app_responsivity.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/register_page/register_controller.dart';
import 'package:flutter_desafio02_interface/app/share/validators/validators.dart';

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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
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
                        DropDownWidget(
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
                              country: selectedCountry!,
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
      ),
    );
  }
}
