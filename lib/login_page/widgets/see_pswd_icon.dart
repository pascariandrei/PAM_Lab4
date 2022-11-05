import 'package:flutter/material.dart';
import 'package:flutter_shop/resources/colors.dart';

import '../../resources/svg_assets.dart';

class SeePswdWidget extends StatefulWidget {
   SeePswdWidget({required this.see}) ;

late final bool see;

  @override
  State<SeePswdWidget> createState() => _SeePswdWidgetState();
}

class _SeePswdWidgetState extends State<SeePswdWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      right: 10.46,
      bottom: 15,
      child: SizedBox(
        width: 28,
        height: 49,
        child: RawMaterialButton(
            onPressed: () {
             setState(() {
               widget.see = !widget.see;
             });
            },
            child: Center(
              child: SvgAssets.seePswd,
            )),
      ),
    );
  }
}

