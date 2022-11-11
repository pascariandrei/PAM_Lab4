import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets {
  static SvgPicture star = SvgPicture.asset('assets/svg/star.svg', width: 15, height: 15);
  static SvgPicture back = SvgPicture.asset('assets/svg/back.svg',width: 6, height: 12);
  static SvgPicture seePswd = SvgPicture.asset('assets/svg/seePswd.svg',width: 19, height: 14);
  static SvgPicture google = SvgPicture.asset('assets/svg/google.svg',width: 32, height: 32);
  static SvgPicture cart = SvgPicture.asset('assets/svg/cart.svg',width: 45, height: 45,      fit: BoxFit.scaleDown);
  static SvgPicture user = SvgPicture.asset('assets/svg/user.svg',width: 32, height: 32, );
}
