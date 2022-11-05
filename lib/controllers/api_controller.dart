import 'package:flutter_shop/models/api_results.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/api_pagination.dart';

class ApiController extends GetxController {
  RxList<ApiPagination> apiProducts = RxList();
  RxList<Results> products = RxList();
  Rxn<ApiPagination?> apipagination = Rxn<ApiPagination>();

  RxInt counter = 1.obs;
  RxInt limit = 23.obs;
  RxString url = ''.obs;

  RxBool isLoadMore = false.obs;
  RxBool hasMore = true.obs;


  Future<void> apiRead() async {

    isLoadMore.value = true;



    http.Response response;
    url.value =
        "http://mobile-shop-api.hiring.devebs.net/products?page=$counter";
    response = await http.get(Uri.parse(url.value));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      apipagination.value = ApiPagination.fromJson(result);
      products.addAll(apipagination.value?.result as Iterable<Results>);
    }


    isLoadMore.value = false;
    counter.value = counter.value + 1;
    hasMore.value = counter.value > 5;
  }
}
