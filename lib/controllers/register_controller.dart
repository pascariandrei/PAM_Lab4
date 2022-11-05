import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/controllers/sign_up_controller.dart';
import 'package:flutter_shop/models/categories.dart';
import 'package:flutter_shop/models/products.dart';
import 'package:flutter_shop/models/registration_post.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';

class RegController extends GetxController {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonenumController = TextEditingController();
  final repeatpasswordController = TextEditingController();

  bool isEqual = false;
  bool isEmty = true;
  String error = "";

  void SaveProducts() {
    if (passwordController.text == repeatpasswordController.text) {
      isEqual = true;
    } else {
      isEqual = false;
    }
    if (fullnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        phonenumController.text.isEmpty ||
        repeatpasswordController.text.isEmpty) {
      isEmty = true;
      error = "Field is empty";
    } else {
      isEmty = false;
    }
    print("fields are emty $isEmty");
    print(" password is equal $isEqual");
    if (isEqual && !isEmty) {
      Registration registration = Registration(
          fullName: fullnameController.text,
          email: emailController.text,
          password: passwordController.text);

      Map<String, dynamic> userData = registration.toJson();
      ApiClient().registerUser(userData);
    } else {
      print("not all good");
    }
  }



}
