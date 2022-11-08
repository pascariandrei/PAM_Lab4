import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/controllers/api_client_controller.dart';
import 'package:get/get.dart';

class RegController extends GetxController {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonenumController = TextEditingController();
  final repeatpasswordController = TextEditingController();

  bool isEqual = false;
  bool isEmty = true;
  bool isEmail = false;
  bool isRegistered = false;
  String error = "";

  void Register() {
    if (passwordController.text == repeatpasswordController.text) {
      isEqual = true;
    } else {
      isEqual = false;
    }
    if (emailController.text.contains(".") &&
        emailController.text.contains("@")) {
      isEmail = true;
    } else {
      isEmail = false;
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
    if (isEqual && !isEmty && isEmail) {
      var userData = <String, String>{
        "full_name": fullnameController.text,
        "email": emailController.text,
        "phone_number": phonenumController.text,
        "password": passwordController.text,
      };

      var response = ApiClient().RegUser(userData);

      response.fold((left) {
        print("unsucces");
        isRegistered = false;
      }, (right) {
        isRegistered = true;
        print("succes");
      });
    } else {
      print("not all good");
    }
  }
}
