import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/colors.dart';
import '../../resources/text_style.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({required this.img,required this.title,required this.subtitle,required this.price,required this.currency}) ;

  final img ;
  final title  ;
  final subtitle  ;
  final price ;
  final currency ;

  @override
  Widget build(BuildContext context) {
    return   Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                //"${homeController.products[index].cover}"),
                "$img"),
            SizedBox(
              height: 8,
            ),
            Text(
             // "${homeController.products[index].title}",
              "$title",
              style: TextStyles.SFProText16.copyWith(
                  color: CustomColor.black,
                  fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
             // "${homeController.products[index].subtitle}",
              "$subtitle",
              style: TextStyles.SFProText12.copyWith(
                  color: CustomColor.gray,
                  fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
             // "\$${homeController.products[index].price}",
              "$currency $price",
              style: TextStyles.SFProText16.copyWith(
                  color: CustomColor.green,
                  fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
    );
  }
}
