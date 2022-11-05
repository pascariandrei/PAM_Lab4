import 'package:flutter/material.dart';
import 'package:flutter_shop/resources/colors.dart';
import '../../resources/text_style.dart';

class SectionsTitleWidget extends StatelessWidget {
  const SectionsTitleWidget({super.key, required this.left_title,required this.right_title})  ;

  final left_title;
  final right_title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Text(
            "$left_title",
            style: TextStyles.SFProText18.copyWith(
                color: CustomColor.black, height: 1.33, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            "$right_title",
            style: TextStyles.SFProText18.copyWith(
                color: CustomColor.black, height: 1.33, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
