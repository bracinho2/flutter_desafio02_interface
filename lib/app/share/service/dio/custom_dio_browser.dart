import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';

class CustomDioForBrowser extends DioForBrowser {
  CustomDioForBrowser() {
    options.baseUrl = 'http://kubolms.com.br/universidade/admin/api/api.php';
  }
}

Dio getDioInstance() => CustomDioForBrowser();
