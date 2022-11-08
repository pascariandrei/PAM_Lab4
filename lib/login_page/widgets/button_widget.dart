import 'package:flutter/material.dart';
import 'package:flutter_shop/login_page/widgets/input_widget.dart';
import 'package:flutter_shop/login_page/widgets/title_widget.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';

import '../../resources/text_style.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({required this.text, this.onPress});

  final String text;
  final Function()? onPress;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 52,
        child: RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            fillColor: CustomColor.green,
            onPressed: widget.onPress,
            child: Center(
              child: Text(
                "${widget.text}",
                style: TextStyles.SFProText14.copyWith(
                    color: CustomColor.whiteSolid,
                    height: 1.71,
                    fontWeight: FontWeight.w600),
              ),
            )),
      ),
    );
  }
}
