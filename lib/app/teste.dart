//Model | Entidade;

import 'package:dio/dio.dart';

void main() {
  Controller controller = Controller();
  controller.fetch();
}

class PersonModel {
  final String id;
  final String name;

  PersonModel(
    this.id,
    this.name,
  );

  //DTO - Data Transfer Object (Mapper);
  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      map['id'] ?? '',
      map['name'] ?? '',
    );
  }

  @override
  String toString() {
    return 'PersonModel: id: $id, name: $name';
  }
}

//view
//Flutter

//controller
class Controller {
  Repository repository = Repository();

  List<PersonModel> minhaLista = [];

  Future<void> fetch() async {
    final response = await repository.fetch();
    minhaLista = response;
    print(minhaLista.map((e) => e.toString()));
  }
}

class Repository {
  IHttpClient service = HttpClientImpl();

  Future<List<PersonModel>> fetch() async {
    final response = await service.fetch();

    final list = response.map((mapa) => PersonModel.fromMap(mapa)).toList();
    return list;
  }
}

//Class abstrata HttpClient; //DIP
abstract class IHttpClient {
  Future<List<Map<String, dynamic>>> fetch();
}

//Convensao pedagogica:
// - I+NOme = interface (classe abstrata)
// - NOme + Impl = implementaçao do contrato;

//Convensao Profissional
//Nome = interface (some o I)
//Nome + impl = implementacao do contrato;

class HttpClientImpl implements IHttpClient {
  Dio dio = Dio();
  @override
  Future<List<Map<String, dynamic>>> fetch() async {
    //DIO > SABE CONECTAR NA INTERNET;
    //final respose = await consultaMInhaapi();

    //Chamou alguém e recebeu o map! =)
    final response = map;

    return response;
  }
}

final map = [
  {
    "id": "01",
    "name": "Alex",
  },
  {
    "id": "02",
    "name": "David",
  }
];
