import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shop/login_page/widgets/button_widget.dart';
import 'package:flutter_shop/login_page/widgets/input_widget.dart';
import 'package:flutter_shop/login_page/widgets/see_pswd_icon.dart';
import 'package:flutter_shop/login_page/widgets/title_widget.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/login_controller.dart';
import '../controllers/register_controller.dart';
import '../controllers/api_client_controller.dart';
import '../forgot_pswd/forgot_page.dart';
import '../home_page/home_page.dart';
import '../resources/text_style.dart';
import '../signup_page/signup_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final textController = TextEditingController();

  final _form = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  void initState() {
    Get.put(LogController());
    Get.put(RegController());
    _passwordVisible = false;
    //super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LogController logcontroller = Get.find();
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
              left_title: "Log in",
            ),
            const SizedBox(
              height: 38,
            ),
            Form(
              key: _form,
              child: Column(
                children: [
                  InputWidget(
                    hintText: "Email",
                    textController: logcontroller.emailController,
                    validate: (check) {
                      if (check?.isEmpty == true) {
                        return "This Field is Empty!";
                      } else if (logcontroller.emailController.text
                              .contains(".") &&
                          logcontroller.emailController.text.contains("@")) {
                        return null;
                      } else {
                        return "Incorect Email";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Stack(children: [
                    InputWidget(
                      hintText: "Password",
                      isPassword: !_passwordVisible,
                      textController: logcontroller.passwordController,
                      validate: (check) {
                        if (check?.isEmpty == true) {
                          return "This Field is Empty!";
                        } else if (logcontroller.passwordController.text !=
                            logcontroller.passwordController.text) {
                          return "Passwords don't match!";
                        }
                        return null;
                      },
                    ),
                    SeePswdWidget(
                      see: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ]),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: SizedBox(
                    height: 24,
                    width: 122,
                    child: RawMaterialButton(
                        onPressed: () {
                          _navigateToForgotPasswordPage(context);
                        },
                        child: Center(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyles.SFProText14.copyWith(
                                color: CustomColor.green,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 44,
            ),
            ButtonWidget(
                text: "Log In",
                onPress: () {
                  logcontroller.loginUser();
                  logcontroller.getUserData();
                  _saveForm();
                  logcontroller.isLoged ? _navigateToHomePage(context) : null;
                }),
            const SizedBox(
              height: 44,
            ),
            Center(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: CustomColor.midGray,
                    width: 137,
                    height: 1,
                  ),
                  const Spacer(),
                  Text(
                    "OR",
                    style: TextStyles.SFProText14.copyWith(
                        color: CustomColor.midGray,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Container(
                    color: CustomColor.midGray,
                    width: 137,
                    height: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            SizedBox(
              height: 44,
              child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  fillColor: CustomColor.graywhite,
                  onPressed: () {},
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Center(
                        child: SvgAssets.google,
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          "Login with Google",
                          style: TextStyles.SFProText14.copyWith(
                              color: CustomColor.gray,
                              height: 1.71,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(
                        width: 32,
                      ),
                    ],
                  )),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                height: 24,
                child: Center(
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        "Not registered yet?",
                        style: TextStyles.SFProText14.copyWith(
                            color: CustomColor.gray,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 65,
                        child: RawMaterialButton(
                            onPressed: () {
                              _navigateToRegisterPage(context);
                            },
                            child: Center(
                              child: Text(
                                "Register",
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
            )
          ],
        ),
      ),
    );
  }

  void _navigateToForgotPasswordPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ForgotPswPage()));
  }

  void _navigateToRegisterPage(BuildContext context) {
    print('_navigateToRegisterPage');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
  }
}
