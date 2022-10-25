import 'package:flutter/material.dart';
import 'package:flutter_shop/models/products.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/home_controller.dart';
import '../../resources/text_style.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 48, right: 16, bottom: 28),
      child: Container(
        child: Row(
          children: [
            Text(
              "Best Selling",
              style: TextStyles.SFProText18.copyWith(
                  color: CustomColor.black, height: 1.33, fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              "See all",
              style: TextStyles.SFProText18.copyWith(
                  color: CustomColor.black, height: 1.33, fontWeight: FontWeight.w400),
            ),


          ],
        ),
      ),
    );
  }
}
