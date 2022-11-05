import 'package:flutter/material.dart';
import 'package:flutter_shop/resources/colors.dart';


class InputWidget extends StatefulWidget {
  const InputWidget({ required this.hintText, this.isPassword = false, this.textController,this.error }) ;

  final hintText;
  final error;
  final bool isPassword;
  final TextEditingController?  textController;


  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 44,
          child:  TextFormField(
            controller: widget.textController,
            obscureText: widget.isPassword,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              errorText: widget.error,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: CustomColor.graywhite ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: CustomColor.gray),
                borderRadius: BorderRadius.circular(4.0),
              ),
                hintText: "${widget.hintText}",
              contentPadding: const EdgeInsets.symmetric( horizontal: 16),

            ),
          ),
        ),
          /*Positioned(
          top: 15,
          right: 10.46,
          bottom: 15,
          child: SizedBox(
            width: 28,
            height: 49,
            child: RawMaterialButton(
                onPressed: () {
                  widget.test;
                },
                child: Center(
                  child: SvgAssets.seePswd,
                )),
          ),
        )*/
      ],
    );
  }
}
