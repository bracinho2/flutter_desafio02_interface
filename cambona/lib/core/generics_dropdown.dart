abstract class DropDownGenerics {
  final String flag;
  final String name;

  const DropDownGenerics({
    required this.name,
    required this.flag,
  });

  @override
  String toString() {
    return 'DropDownGeneric: Name: $name Flag: $flag';
  }
}
