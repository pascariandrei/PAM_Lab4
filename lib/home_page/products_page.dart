import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/api_controller.dart';
import '../sms_page/sms_page.dart';
import '../terms_page/terms_page.dart';
import 'widgets/category_widget.dart';
import 'widgets/sections_title.dart';
import 'widgets/product_widget.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  final scrollController = ScrollController();
  List prod = [];
  bool isLoadingMore = false;
  int _selectedIndex = 1;

  @override
  void initState() {
    Get.put(HomeController());
    final HomeController homeController = Get.find();
    homeController.loadProducts();

    Get.put(ApiController());
    final ApiController apiController = Get.find();

    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollListener() async {
    final ApiController apiController = Get.find();
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent &&
        !apiController.isLoadMore.value) {
      await apiController.apiRead();
    }
  }




  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.find();
    return  Container(
      color: CustomColor.whiteSmoke,
      child: CustomScrollView(
        controller: scrollController,
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
          Obx(() => SliverPadding(
            padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 28),
            sliver: SliverGrid(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                //mainAxisSpacing: 26,
                childAspectRatio: 0.67,
                //mainAxisExtent:0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  // if (index != (apiController.products.length)) {
                  return ProductWidget(
                    title: apiController.products[index].name,
                    img: apiController.products[index].mainImage,
                    subtitle: apiController.products[index].details,
                    price: apiController.products[index].id,
                    currency: apiController.products[index].name,
                    icon: SvgAssets.star,
                  );
                  // }
                },
                childCount: apiController.products.length,
                /*childCount: apiController.isLoadMore.value
                        ? (apiController.products.length + 1)
                        : (apiController.products.length),*/
              ),
            ),
          )),
          Obx(
                () => SliverToBoxAdapter(

              //   if(apiController.products.length ){

                child: apiController.isLoadMore.value
                    ? const Center(
                  child: SizedBox(
                    //color: Colors.green,
                    height: 100,
                    width: 100,
                    child: SizedBox(child: CircularProgressIndicator()),
                  ),
                )
                    : const SizedBox(
                  child: SizedBox(

                  ),
                )
              // }
            ),
          ),

        ],
      ),
    );
  }
}
