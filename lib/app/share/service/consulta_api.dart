import 'package:dio/dio.dart';

class ConsultaAPI {
  final Dio _dio;
  final consulta = {
    "dominio": "insidesistemas",
    "senha": "*tjZl\$a^Zs9A",
    "classe": "empresa",
    "metodo": "listar_por_cnpj",
    "cnpj": "05.623.256/0001-79"
  };

  final url = 'http://kubolms.com.br/universidade/admin/api/api.php';

  ConsultaAPI(this._dio);

  void fetch() async {
    final response = await _dio.post(url, data: consulta);
    print(response.data);
  }
}
