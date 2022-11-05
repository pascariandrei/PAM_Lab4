import 'package:flutter/material.dart';
import 'package:flutter_shop/login_page/widgets/input_widget.dart';
import 'package:flutter_shop/login_page/widgets/title_widget.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';

import '../login_page/widgets/button_widget.dart';
import '../login_page/widgets/see_pswd_icon.dart';
import '../resources/text_style.dart';

class ResetPswd extends StatefulWidget {
  const ResetPswd({Key? key}) : super(key: key);

  @override
  State<ResetPswd> createState() => _ForgotPswPageState();
}

bool _passwordVisible = false;
bool _repeatpasswordVisible = false;

@override
void initState() {
  _passwordVisible = false;
  _repeatpasswordVisible = false;
}

class _ForgotPswPageState extends State<ResetPswd> {
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
                  onPressed: () {},
                  child: Center(
                    child: SvgAssets.back,
                  )),
            ),
            const SizedBox(
              height: 34 - 15,
            ),
            const TitleWidget(
              left_title: "Reset Password",
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Set the new password for your account so you can login and access all the features",
              style: TextStyles.SFProText14.copyWith(
                  color: CustomColor.gray,
                  height: 1.71,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 28,
            ),
            Stack(children: [
              InputWidget(
                  hintText: "Reset Password", isPassword: !_passwordVisible),
              Positioned(
                top: 15,
                right: 10.46,
                bottom: 15,
                child: SizedBox(
                  width: 28,
                  height: 49,
                  child: RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Center(
                        child: SvgAssets.seePswd,
                      )),
                ),
              ),

            ]),
            const SizedBox(
              height: 26,
            ),
            Stack(children: [
              InputWidget(
                  hintText: "Repeat Password",
                  isPassword: !_repeatpasswordVisible),
              Positioned(
                top: 15,
                right: 10.46,
                bottom: 15,
                child: SizedBox(
                  width: 28,
                  height: 49,
                  child: RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          _repeatpasswordVisible = !_repeatpasswordVisible;
                        });
                      },
                      child: Center(
                        child: SvgAssets.seePswd,
                      )),
                ),
              ),
            ]),
            const SizedBox(
              height: 44,
            ),
            const ButtonWidget(
              btnText: "SUBMIT CHANGES",
            ),
          ],
        ),
      ),
    );
  }
}
