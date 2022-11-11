import 'package:flutter/material.dart';
import 'package:flutter_shop/home_page/products_page.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:get/get.dart';
import '../controllers/api_controller.dart';
import '../resources/colors.dart';
import '../resources/text_style.dart';
import '../sms_page/sms_page.dart';
import '../terms_page/terms_page.dart';
import '../user_detail_page/user_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final Pages = [
    const Products(),
    const SmsPage(),
    const UserDetail(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          Products(),
          SmsPage(),
          UserDetail(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomNavigationBar(
          //type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.only(left: 56 - 16),
                child: Text(
                  "Explore",
                  style: TextStyles.SFProText14.copyWith(
                      color: CustomColor.black,
                      height: 1.33,
                      fontWeight: FontWeight.w700),
                ),
              ),
              label: '1',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                  height: 32, width: 45, child: Center(child: SvgAssets.cart)),
              label: '2',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(right: 56 - 16),
                  child: SvgAssets.user),
              label: '3',
            ),
          ],
          currentIndex: _selectedIndex,
          //New
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
