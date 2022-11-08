import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/controllers/api_client_controller.dart';
import 'package:flutter_shop/models/categories.dart';
import 'package:flutter_shop/models/get_token.dart';
import 'package:flutter_shop/models/products.dart';
import 'package:flutter_shop/models/registration_post.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';

import '../models/login_post.dart';
import '../models/login_post.dart';

class LogController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString accessToken = "".obs;
  RxString refreshToken = "".obs;

  bool isEmty = true;
  bool isEmail = false;
  bool isLoged = false;
  String error = "";
  String message = "";

  void loginUser() async {
    print('loginUserloginUser');
    if (emailController.text.contains(".") &&
        emailController.text.contains("@")) {
      isEmail = true;
    } else {
      isEmail = false;
    }
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      isEmty = true;
      error = "Field is empty";
    } else {
      isEmty = false;
    }
    print("fields are emty $isEmty");
    if (!isEmty && isEmail) {
      var userData = <String, String>{
        "email": emailController.text,
        "password": passwordController.text,
      };
      var response = await ApiClient().LogUser(userData);
      response.fold((left) {
        print("unsucces");
      }, (right) {
        accessToken.value = right.access.toString();
        refreshToken.value = right.refresh.toString();
      });

      var res  = await ApiClient().GetUserData(accessToken.value as String?);
      res.fold((left) {
        print("unsucces");
      }, (right) {
        print("Getuserdata ${right.fullName}");
      });
      isLoged = true;

    }
  }

  void getUserData() async{

  }


}
