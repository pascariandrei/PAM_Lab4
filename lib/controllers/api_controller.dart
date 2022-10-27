import 'package:flutter/services.dart';
import 'package:flutter_shop/models/categories.dart';
import 'package:flutter_shop/models/products.dart';
import 'package:flutter_shop/models/api_results.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class ApiController extends GetxController {
  RxList<Results> apiProducts = RxList();
  //RxList<Results> apiCategories = RxList();

  Future<void> apiRead() async {
    http.Response response;
    response = await http.get(Uri.parse('http://mobile-shop-api.hiring.devebs.net/products'));


    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      apiProducts.value = (result['results'] as List).map((value) => Results.fromJson(value)).toList();
      //apiProducts.value = (result['results'] as List).map((value) => Results.fromJson(value)).toList();
    }
    print("${apiProducts[0]}");
  }
}
