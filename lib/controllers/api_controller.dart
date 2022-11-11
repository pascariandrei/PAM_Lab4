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

  int page = 1;
  RxInt limit = 23.obs;
  RxString url = ''.obs;

  RxBool isLoadMore = false.obs;
  RxBool hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    apiRead();
  }

  Future<void> apiRead() async {
    isLoadMore.value = true;

    http.Response response;
    url.value = "http://mobile-shop-api.hiring.devebs.net/products?page=$page";
    print("${url.value}");
    response = await http.get(Uri.parse(url.value));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      apipagination.value = ApiPagination.fromJson(result);
      products.addAll(apipagination.value?.result as Iterable<Results>);
    }

    page++;
    isLoadMore.value = false;

    hasMore.value = page > 5;
  }
}
