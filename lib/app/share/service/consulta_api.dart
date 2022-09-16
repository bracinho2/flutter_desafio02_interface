import 'package:dio/dio.dart';

class ConsultaAPI {
  final Dio _dio;
  final consulta = {};

  final url = 'http://kubolms.com.br/universidade/admin/api/api.php';

  ConsultaAPI(this._dio);

  void fetch() async {
    final response = await _dio.post(url, data: consulta);
    print(response.data);
  }
}
