import 'package:flutter/material.dart';
import 'package:flutter_shop/resources/colors.dart';


class InputWidget extends StatefulWidget {
  const InputWidget({ required this.hintText, this.isPassword = false, this.textController, this.validate }) ;

  final hintText;
 // final error;
  final bool isPassword;
  final TextEditingController?  textController;
  final String? Function(String?)?  validate;


  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child:  TextFormField(
        controller: widget.textController,
        obscureText: widget.isPassword,
        enableSuggestions: false,
        autocorrect: false,
       validator: widget.validate,
        decoration: InputDecoration(
         // errorText: widget.error,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: CustomColor.graywhite ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: CustomColor.gray),
            borderRadius: BorderRadius.circular(4.0),
          ),
            hintText: "${widget.hintText}",
          contentPadding: const EdgeInsets.symmetric( horizontal: 16, vertical: 6),

        ),
      ),
    );
  }
}
