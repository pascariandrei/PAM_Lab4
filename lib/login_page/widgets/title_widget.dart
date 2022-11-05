import 'package:flutter/material.dart';
import 'package:flutter_shop/resources/colors.dart';
import '../../resources/text_style.dart';

class TitleWidget extends StatelessWidget {
  const  TitleWidget({super.key, required this.left_title })  ;

  final left_title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$left_title",
          style: TextStyles.SFProText26.copyWith(
              color: CustomColor.black, height: 1.38, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
