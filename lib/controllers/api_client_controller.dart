import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_shop/models/get_token.dart';
import 'package:flutter_shop/models/login_post.dart';
import 'package:flutter_shop/models/registration_post.dart';

import '../models/user_data.dart';

class ApiClient {
  final Dio _dio = Dio();
  String tok = "";

  Future<Either<RegistrationError, Registration>> RegUser(
      Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
          'http://mobile-shop-api.hiring.devebs.net/users/register',
          data: userData, //REQUEST BODY
          // queryParameters: {'apikey': 'YOUR_API_KEY'},  //QUERY PARAMETERS
          options: Options(headers: {
            'app-id': '6112dc7c3f812e0d9b6679dd', //HEADERS
          }));
      //Registration registration = Registration.fromJson(response.data);

      print("Either ${response.data}");
      return Right(Registration.fromJson(response.data));
    } on DioError catch (e) {
      print("Error ${e.response?.data}");
      return Left(RegistrationError(e.response?.data));
    }
  }

  Future<Either<LoginError, Login>> LogUser(
      Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
        'http://mobile-shop-api.hiring.devebs.net/users/login',
        data: userData,
          options: Options(headers: {
            'app-id': '6112dc7c3f812e0d9b6679dd', //HEADERS
          })
        //queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      //returns the successful user data json object
      return Right(Login.fromJson(response.data));
    } on DioError catch (e) {
      print("Error ${e.response?.data}");
      return Left(LoginError(e.response?.data));
    }
  }

  Future<Either<UserDataError, UserData>> GetUserData(
       String? accesToken) async {
    try {
      Response response = await _dio.get(
          'http://mobile-shop-api.hiring.devebs.net/users/profile',
          queryParameters: {'apikey': 'YOUR_API_KEY'},
          options: Options(headers: {
            'app-id': '6112dc7c3f812e0d9b6679dd',
            'Authorization': 'Token $accesToken',
          })
        //queryParameters: {'apikey': 'YOUR_API_KEY'},
      );
      return Right(UserData.fromJson(response.data));
    } on DioError catch (e) {
      print("Error ${e.response?.data}");
      return Left(UserDataError(e.response?.data));
    }
  }

}
