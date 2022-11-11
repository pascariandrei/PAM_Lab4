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

class LogoutController extends GetxController {
void logOut() async{
  var res  = await ApiClient().getUserData('');
  res.fold((left) {
    print("esti delogat!");
  }, (right) {
    print("Ceva neto");
  });
}



}
