import 'package:flutter/material.dart';
import 'package:flutter_shop/forgot_pswd/forgot_page.dart';
import 'package:flutter_shop/signup_page/signup_page.dart';
import 'package:flutter_shop/sms_page/sms_page.dart';
import 'package:flutter_shop/user_detail_page/user_detail.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'home_page/home_page.dart';
import 'login_page/login_page.dart';
import 'resetPswd_page/reset_pswd.dart';
import 'terms_page/terms_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home:  LoginWidget(),
    );
  }
}
