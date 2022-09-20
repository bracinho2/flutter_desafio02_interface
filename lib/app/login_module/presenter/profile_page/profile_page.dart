import 'dart:io';
import 'package:cambona/core/generics_dropdown.dart';
import 'package:cambona/dummy/contries.dart';
import 'package:cambona/widgets/confirm_buttom_widget.dart';
import 'package:cambona/widgets/custom_upload_photo_widget.dart';
import 'package:cambona/widgets/drop_down_menu.dart';
import 'package:cambona/widgets/input_text_field_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:cambona/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio02_interface/app/core/app_responsivity.dart';
import 'package:flutter_desafio02_interface/app/login_module/presenter/profile_page/profile_controller.dart';
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

    DropDownGenerics? selectedCountry;

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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Resposivity.automatic(500, mediaQueryData),
          ),
          child: ListView(
            children: [
              const WelcomeWidget(
                title: 'Setting up your',
                subtitle: 'profile',
                ask: 'Add your profile photo',
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
                    horizontal: Resposivity.automatic(24, mediaQueryData),
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
                            _phoneController.text = country!.dialCode;
                          },
                          label: 'Country',
                          value: selectedCountry as Country,
                        ),
                        const TextTitleWidget(title: 'Phone'),
                        InputTextFieldWidget(
                          label: 'Phone',
                          controller: _phoneController,
                          validator: Validators.validateEmail,
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
      ),
    );
  }
}
