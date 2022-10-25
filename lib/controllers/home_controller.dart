import 'package:flutter/services.dart';
import 'package:flutter_shop/models/categories.dart';
import 'package:flutter_shop/models/products.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';

class HomeController extends GetxController {
  RxList<Products> products = RxList();
  RxList<Categories> categories = RxList();

  Future<void> loadProducts() async {
      final readJson = await rootBundle.loadString('assets/json/shop.json');
      final jsonResponse = await json.decode(readJson);
      products.value = (jsonResponse['products'] as List).map((value) => Products.fromJson(value)).toList();
      categories.value = (jsonResponse['categories'] as List).map((value) => Categories.fromJson(value)).toList();
  }
}
