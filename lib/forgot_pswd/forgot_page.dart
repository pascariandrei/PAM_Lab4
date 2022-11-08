import 'package:flutter/material.dart';
import 'package:flutter_shop/login_page/widgets/input_widget.dart';
import 'package:flutter_shop/login_page/widgets/title_widget.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';

import '../login_page/widgets/button_widget.dart';
import '../resources/text_style.dart';

class ForgotPswPage extends StatefulWidget {
  const ForgotPswPage({Key? key}) : super(key: key);

  @override
  State<ForgotPswPage> createState() => _ForgotPswPageState();
}

class _ForgotPswPageState extends State<ForgotPswPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: CustomColor.whiteSolid,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 66 - 15,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: RawMaterialButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Center(
                    child: SvgAssets.back,
                  )),
            ),
            const SizedBox(
              height: 34 - 15,
            ),
            const TitleWidget(
              left_title: "Forgot Password",
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Enter your email for verification process,we will send a code to your email",
              style: TextStyles.SFProText14.copyWith(
                  color: CustomColor.gray,
                  height: 1.71,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 28,
            ),
            const InputWidget(hintText: "Email"),
            const SizedBox(
              height: 44,
            ),
            const ButtonWidget(text: "SEND REQUEST"),
          ],
        ),
      ),
    );
  }
}
