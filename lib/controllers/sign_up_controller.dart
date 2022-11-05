import 'package:dio/dio.dart';
import 'package:flutter_shop/models/registration_post.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
  //  print(userData.length);
    try {
      Response response = await _dio.post(
          'http://mobile-shop-api.hiring.devebs.net/users/register',
          //ENDPONT URL
          data: userData, //REQUEST BODY
          // queryParameters: {'apikey': 'YOUR_API_KEY'},  //QUERY PARAMETERS
          options: Options(headers: {
            'app-id': '6112dc7c3f812e0d9b6679dd', //HEADERS
          }));
      print("Verificare ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print("Verificare ${e.response!.data}");
      return e.response!.data;
    }
  }
}
