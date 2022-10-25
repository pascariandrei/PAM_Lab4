import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:flutter_shop/resources/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'resources/svg_assets.dart';

import 'home_page/widgets/category_widget.dart';
import 'home_page/widgets/product_title.dart';
import 'home_page/widgets/product_widget.dart';
import 'home_page/widgets/category_title_widget.dart';
import 'models/products.dart';

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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      body: Container(
        color: CustomColor.whiteSmoke,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    CategoryTitleWidget(),
                    CategoryWidget(),
                    ProductTitleWidget(),
                  ],
                );
              }, childCount: 1),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 28),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 26,
                  childAspectRatio: 0.65,
                  //mainAxisExtent:0,
                ),
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Obx(
                          () => Container(
                            //color: Colors.brown,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                    "${homeController.products[index].cover}"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${homeController.products[index].title}",
                                  style: TextStyles.SFProText16.copyWith(
                                      color: CustomColor.black,
                                      fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  "${homeController.products[index].subtitle}",
                                  style: TextStyles.SFProText12.copyWith(
                                      color: CustomColor.gray,
                                      fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "\$${homeController.products[index].price}",
                                  style: TextStyles.SFProText16.copyWith(
                                      color: CustomColor.green,
                                      fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                    childCount: homeController.products.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
