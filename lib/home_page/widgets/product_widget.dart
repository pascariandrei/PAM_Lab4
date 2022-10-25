import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/colors.dart';
import '../../resources/text_style.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.currency,
    required this.icon,
  });

  final img;
  final title;
  final subtitle;
  final price;
  final currency;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                  //"${homeController.products[index].cover}"),
                  "$img"),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  child: Center(child: icon),
                  //margin: const EdgeInsets.only(right: 8, top: 8),

                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: CustomColor.whiteSolid,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            // "${homeController.products[index].title}",
            "$title",
            style: TextStyles.SFProText16.copyWith(
                color: CustomColor.black, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            // "${homeController.products[index].subtitle}",
            "$subtitle",
            style: TextStyles.SFProText12.copyWith(
                color: CustomColor.gray, fontWeight: FontWeight.w400),
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
                color: CustomColor.green, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
