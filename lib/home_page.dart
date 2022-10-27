import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'controllers/api_controller.dart';
import 'home_page/widgets/category_widget.dart';
import 'home_page/widgets/sections_title.dart';
import 'home_page/widgets/product_widget.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Get.put(HomeController());
    final HomeController homeController = Get.find();
    homeController.loadProducts();

    Get.put(ApiController());
    final ApiController apiController = Get.find();
    apiController.apiRead();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final ApiController apiController = Get.find();
    return Scaffold(
      body: Container(
        color: CustomColor.whiteSmoke,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: const [
                    SizedBox(
                      height: 48,
                    ),
                    SectionsTitleWidget(
                      left_title: "Categories",
                      right_title: "",
                    ),
                    CategoryWidget(),
                    SectionsTitleWidget(
                      left_title: "Best Selling",
                      right_title: "See all",
                    ),
                    SizedBox(
                      height: 28,
                    ),
                  ],
                );
              }, childCount: 1),
            ),
            Obx(
              () => SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 28),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    //mainAxisSpacing: 26,
                    childAspectRatio: 0.67,
                    //mainAxisExtent:0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ProductWidget(
                            /*img: homeController.products[index].cover,
                            // img: apicontroller.stringResp.toString(),
                            title: apiController.apiProducts[index].price,
                            //title: homeController.products[index].title,
                            subtitle: homeController.products[index].subtitle,
                            price: homeController.products[index].price,
                            currency: homeController.products[index].currency,
                            icon: SvgAssets.star,*/
                            img: apiController.apiProducts[index].mainimage,
                            // img: apicontroller.stringResp.toString(),
                            title: apiController.apiProducts[index].category.name,
                            //title: homeController.products[index].title,
                            subtitle:apiController.apiProducts[index].details,
                            price:apiController.apiProducts[index].price,
                            currency: apiController.apiProducts[index].id,
                            icon: SvgAssets.star,
                          ),
                      childCount: apiController.apiProducts.length),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
