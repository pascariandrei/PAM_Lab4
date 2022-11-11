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
import '../models/user_data.dart';

class LogController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxString accessToken = "".obs;
  RxString refreshToken = "".obs;
  Rxn<UserData?> userdata = Rxn<UserData?>();

  bool isEmty = true;
  bool isEmail = false;
  bool isLoged = false;
  String error = "";
  String message = "";

  void loginUser(Function(bool success) onLoggedIn) async {
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
      var response = await ApiClient().logUser(userData);
      response.fold((left) {
        print("unsucces");
      }, (right) {
        accessToken.value = right.access.toString();
        refreshToken.value = right.refresh.toString();
        isLoged = true;
      });

      var res  = await ApiClient().getUserData(accessToken.value);
      res.fold((left) {
        print("unsucces");
      }, (right) {
        onLoggedIn.call(true);
        print("Getuserdata ${right.fullName}");
        //userdata = UserData(fullName: right.fullName, email: right.email);
        userdata.value = right;
        print("data user ${userdata.value?.email}");
        print("data user ${userdata.value?.phoneNumber}");
      });


    }
  }





}
