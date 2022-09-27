import 'package:cambona/cambona.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/register_page/register_controller.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/contries.dart';
import 'package:flutter_desafio02_interface/app/share/validators/masks.dart';
import 'package:flutter_desafio02_interface/app/share/validators/validators.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final controller = RegisterController();

  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  Country? selectedCountry;

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
                '😎 Hello',
                style: themeDataNormal.textTheme.titleLarge,
              ),
              subtitle: Text(
                'Are You new here?',
                style: themeDataNormal.textTheme.titleLarge,
              ),
              ask: RichText(
                text: TextSpan(
                  style: themeDataNormal.textTheme.titleMedium,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'If you have an account ',
                      style: TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                    TextSpan(
                      text: ' | Login',
                      style: themeDataNormal.textTheme.titleMedium,
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() => Navigator.pop(context)),
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
                    horizontal: Responsivity.automatic(24, mediaQueryData)),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //INPUT TEXT FORM FIELD
                      TextTitleWidget(
                        title: Text(
                          'Full Name',
                          style: themeDataNormal.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('Full Name'),
                        controller: _nameController,
                        validator: Validators.validateName,
                        prefixIcon: Icons.person,
                      ),
                      TextTitleWidget(
                        title: Text(
                          'CPF',
                          style: themeDataNormal.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('CPF'),
                        controller: _cpfController,
                        validator: Validators.validateCPF,
                        prefixIcon: Icons.numbers,
                        inputFormatters: [
                          CpfMask(),
                        ],
                      ),
                      TextTitleWidget(
                        title: Text(
                          'Email',
                          style: themeDataNormal.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('Email'),
                        controller: _emailController,
                        validator: Validators.validateEmail,
                        prefixIcon: Icons.email,
                      ),
                      TextTitleWidget(
                        title: Text(
                          'Country',
                          style: themeDataNormal.textTheme.titleSmall,
                        ),
                      ),
                      CustomDropDownWidget<Country>(
                        validator: Validators.validateDropDown,
                        items: countries.map((Country value) {
                          return DropdownMenuItem<Country>(
                            value: value,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Text(value.flag),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  value.name,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (country) {
                          selectedCountry = country;
                          _phoneController.text = country!.dialCode;
                        },
                        label: 'Country',
                      ),
                      TextTitleWidget(
                        title: Text(
                          'Phone',
                          style: themeDataNormal.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('Phone'),
                        controller: _phoneController,
                        validator: Validators.validatePhone,
                        prefixIcon: Icons.phone,
                      ),
                      TextTitleWidget(
                        title: Text(
                          'Password',
                          style: themeDataNormal.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('Password'),
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
                          controller.registerValidate(
                            name: _nameController.text,
                            cpf: _cpfController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            password: _passwordController.text,
                            country: selectedCountry,
                          );
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
