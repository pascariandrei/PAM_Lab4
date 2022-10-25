import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/fonts.dart';
import 'package:flutter_shop/resources/text_style.dart';

class CategoryTitleWidget extends StatelessWidget {
  const CategoryTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16,top:48),
      child: Container(
        width: 99,
        height: 24,
          child: Text(
            "Categories",
            style: TextStyles.SFProText18.copyWith(color: CustomColor.black, height: 1.3),
          ),
      ),
    );
  }
}
