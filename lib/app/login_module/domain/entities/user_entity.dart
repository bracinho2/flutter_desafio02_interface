import 'package:flutter_desafio02_interface/app/share/dummy_data/contries.dart';

class UserEntity {
  final String name;
  final String cpf;
  final String email;
  final String phone;
  final String password;
  final Country country;

  UserEntity({
    required this.name,
    required this.cpf,
    required this.email,
    required this.phone,
    required this.password,
    required this.country,
  });

  @override
  String toString() {
    return 'User > Name: $name CPF: $cpf Email: $email Phone: $phone Password: $password Country: $country';
  }
}
