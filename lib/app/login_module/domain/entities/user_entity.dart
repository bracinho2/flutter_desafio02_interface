class UserEntity {
  final String name;
  final String cpf;
  final String email;
  final String phone;
  final String password;

  UserEntity({
    required this.name,
    required this.cpf,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  String toString() {
    return 'User > Name: $name CPF: $cpf Email: $email Phone: $phone Password: $password';
  }
}
