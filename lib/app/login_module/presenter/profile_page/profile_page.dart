import 'dart:io';
import 'package:cambona/themes/themes.dart';
import 'package:cambona/widgets/confirm_buttom_widget.dart';
import 'package:cambona/widgets/custom_drop_down_widget.dart';
import 'package:cambona/widgets/custom_upload_photo_widget.dart';
import 'package:cambona/widgets/input_text_field_password_widget.dart';
import 'package:cambona/widgets/input_text_field_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:cambona/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/responsivity/app_responsivity.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/profile_page/profile_controller.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/contries.dart';
import 'package:flutter_desafio02_interface/app/share/dummy_data/dummy_user.dart';
import 'package:flutter_desafio02_interface/app/share/validators/validators.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = ProfileController();

  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  File? avatarImage;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final themeData = Theme.of(context);

    Country? selectedCountry;

    if (FakeUser.user != null) {
      _nameController.text = FakeUser.user!.name;
      _cpfController.text = FakeUser.user!.cpf;
      _emailController.text = FakeUser.user!.email;
      _phoneController.text = FakeUser.user!.phone;
      _passwordController.text = FakeUser.user!.password;
      selectedCountry = FakeUser.user?.country;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: ListView(
          children: [
            WelcomeWidget(
              title: Text(
                '😎 Setting up your',
                style: themeData.textTheme.titleLarge,
              ),
              subtitle: Text(
                'profile',
                style: themeData.textTheme.titleLarge,
              ),
              ask: Text(
                'Add your profile foto',
                style: themeData.textTheme.titleMedium,
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
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomUploadPhotoWidget(
                        file: avatarImage,
                        onTap: () async {
                          await controller.pickImage();

                          setState(() {
                            avatarImage = controller.file;
                          });
                        },
                      ),
                      //INPUT TEXT FORM FIELD
                      TextTitleWidget(
                        title: Text(
                          'Full Name',
                          style: themeData.textTheme.titleSmall,
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
                          style: themeData.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('CPF'),
                        controller: _cpfController,
                        validator: Validators.validateCPF,
                        prefixIcon: Icons.numbers,
                      ),
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
                        prefixIcon: Icons.email,
                      ),
                      const TextTitleWidget(title: Text('Country')),
                      CustomDropDownWidget<Country>(
                        items: countries.map((Country value) {
                          return DropdownMenuItem<Country>(
                            value: value,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Text(value.name),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  value.flag,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (country) {
                          _phoneController.text = country!.dialCode;
                        },
                        label: 'Country',
                        value: selectedCountry as Country,
                      ),
                      TextTitleWidget(
                        title: Text(
                          'Phone',
                          style: themeData.textTheme.titleSmall,
                        ),
                      ),
                      InputTextFieldWidget(
                        label: const Text('Phone'),
                        controller: _phoneController,
                        validator: Validators.validateEmail,
                        prefixIcon: Icons.phone,
                      ),
                      TextTitleWidget(
                        title: Text(
                          'Password',
                          style: Theme.of(context).textTheme.titleSmall,
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

                      //REGISTER BUTTON
                      ConfirmButtonWidget(
                        title: 'Confirm',
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
    );
  }
}
