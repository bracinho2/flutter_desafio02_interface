import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDioForNative extends DioForNative {
  CustomDioForNative() {
    options.baseUrl = 'http://kubolms.com.br/universidade/admin/api/api.php';
  }
}

Dio getDioInstance() => CustomDioForNative();
