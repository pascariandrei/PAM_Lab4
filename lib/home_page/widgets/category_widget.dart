import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../resources/colors.dart';
import '../../resources/text_style.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Obx(()=>Container(
      margin: const EdgeInsets.only(left: 16, top: 18, bottom: 44),
      height: 74,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: CustomColor.whiteSolid,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.network(
                    homeController.categories[index].icon,
                    fit: BoxFit.contain,
                    width: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
                width: 60,
                //color: Colors.cyan,
                child: Center(
                  child: Text(
                    homeController.categories[index].title,
                    style: TextStyles.SFProText12.copyWith(
                        color: CustomColor.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
          separatorBuilder: (context, _) => const SizedBox(
            width: 18,
          ),
          itemCount: homeController.categories.length),
    ),);
  }
}
