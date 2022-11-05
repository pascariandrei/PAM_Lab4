import 'package:flutter/material.dart';
import 'package:flutter_shop/login_page/widgets/input_widget.dart';
import 'package:flutter_shop/login_page/widgets/title_widget.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';

import '../login_page/widgets/button_widget.dart';
import '../resources/text_style.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({Key? key}) : super(key: key);

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
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
              left_title: "SMS Code",
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Please enter your verificatin code from SMS",
              style: TextStyles.SFProText14.copyWith(
                  color: CustomColor.gray,
                  height: 1.71,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 28,
            ),
            const InputWidget(hintText: "SMS Code"),
            const SizedBox(
              height: 44,
            ),
            const ButtonWidget(btnText: "CONFIRM ACCOUNT",),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 24,
              child: Center(
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      "You can get a new code through",
                      style: TextStyles.SFProText14.copyWith(
                          color: CustomColor.gray,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 65,
                      child: RawMaterialButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "00:00",
                              style: TextStyles.SFProText14.copyWith(
                                  color: CustomColor.green,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
