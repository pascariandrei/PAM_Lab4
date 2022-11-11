import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:flutter_shop/login_page/login_page.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/api_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/logout_controller.dart';
import '../controllers/register_controller.dart';
import '../resources/text_style.dart';
import '../sms_page/sms_page.dart';
import '../terms_page/terms_page.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    Get.put(LogController());
    Get.put(ApiController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LogController logController = Get.find();
    final LogoutController logoutController = Get.find();
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        color: CustomColor.whiteSmoke,
        child: SizedBox(
          height: 50,
          width: 100,
          child: Text(
            " ${logController.userdata.value?.fullName}",
            style: TextStyles.SFProText18.copyWith(
                color: CustomColor.black,
                height: 1.33,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      SizedBox(
        height: 30,
        width: 30,
        child: RawMaterialButton(
          child: Text(
            " Logout",
            style: TextStyles.SFProText18.copyWith(
                color: CustomColor.black,
                height: 1.33,
                fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            logoutController.logOut();
            Get.delete<ApiController>();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginWidget()));
          },
        ),
      ),
    ]);
  }

  _logout() async {}
}
