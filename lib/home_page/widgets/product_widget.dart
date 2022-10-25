/*
import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/colors.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Obx(()=>Container(
      color: Colors.brown,
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
    ),);
  }
}
*/
