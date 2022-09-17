import 'dart:convert';

import 'package:dio/dio.dart';

class ConsultaDio {
  BaseOptions teste = BaseOptions();
  Dio dio = Dio();

  Future<List<Map<String, dynamic>>> fetch() async {
    final response = await dio
        .post('http://kubolms.com.br/universidade/admin/api/api.php', data: {
      "dominio": "insidesistemas",
      "senha": "*tjZl\$a^Zs9A",
      "classe": "empresa",
      "metodo": "listar_por_cnpj",
      "cnpj": "05.623.256/0001-79"
    });

    final json = jsonDecode(response.data);

    final values =
        (json as List).map((e) => Map<String, dynamic>.from(e)).toList();

    print(values);
    return values;
  }
}

class Repository {
  ConsultaDio dio = ConsultaDio();

  Future<void> fetch() async {
    final values = await dio.fetch();

    //cnpj
    //codigo
  }
}
