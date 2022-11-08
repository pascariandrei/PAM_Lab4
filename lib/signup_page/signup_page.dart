import 'package:flutter/material.dart';
import 'package:flutter_shop/login_page/login_page.dart';
import 'package:flutter_shop/login_page/widgets/button_widget.dart';
import 'package:flutter_shop/login_page/widgets/input_widget.dart';
import 'package:flutter_shop/login_page/widgets/see_pswd_icon.dart';
import 'package:flutter_shop/login_page/widgets/title_widget.dart';
import 'package:flutter_shop/models/registration_post.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:email_validator/email_validator.dart';
import '../controllers/register_controller.dart';
import '../resources/text_style.dart';
import '../terms_page/terms_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _ForgotPswPageState();
}

final _form = GlobalKey<FormState>();
bool isChecked = false;
bool _passwordVisible = false;
bool _repeatpasswordVisible = false;

@override
void initState() {
  Get.put(RegController());
  final RegController regController = Get.find();
  String check = regController.fullnameController.text.toString();

  _passwordVisible = false;
  _repeatpasswordVisible = false;
}

class _ForgotPswPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final RegController regController = Get.find();
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: SvgAssets.back,
                  )),
            ),
            const SizedBox(
              height: 34 - 15,
            ),
            const TitleWidget(
              left_title: "Sign Up",
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Please enter the required information for sign up",
              style: TextStyles.SFProText14.copyWith(
                  color: CustomColor.gray,
                  height: 1.71,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 28,
            ),
            //InputWidget(hintText: "Full Name",textController:regController.fullnameController),
            Form(
              key: _form,
              child: Column(
                children: [
                  InputWidget(
                    hintText: "Full Name",
                    textController: regController.fullnameController,
                    validate: (check) {
                      if (check?.isEmpty == true) {
                        return "This Field is Empty!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputWidget(
                    hintText: "Email",
                    textController: regController.emailController,
                    validate: (check) {
                      if (check?.isEmpty == true) {
                        return "This Field is Empty!";
                      } else if (regController.emailController.text
                              .contains(".") &&
                          regController.emailController.text.contains("@")) {
                        return null;
                      } else {
                        return "Incorect Email";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputWidget(
                    hintText: "Phone",
                    textController: regController.phonenumController,
                    validate: (check) {
                      if (check?.isEmpty == true) {
                        return "This Field is Empty!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Stack(children: [
                    //InputWidget(hintText: "Password", isPassword:!_passwordVisible,textController:regController.passwordController,),
                    InputWidget(
                      hintText: "Password",
                      isPassword: !_passwordVisible,
                      textController: regController.passwordController,
                      validate: (check) {
                        if (check?.isEmpty == true) {
                          return "This Field is Empty!";
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
                  const SizedBox(
                    height: 16,
                  ),
                  Stack(children: [
                    InputWidget(
                      hintText: "Repeat Password",
                      isPassword: !_repeatpasswordVisible,
                      textController: regController.repeatpasswordController,
                      validate: (check) {
                        if (check?.isEmpty == true) {
                          return "This Field is Empty!";
                        } else if (regController
                                .repeatpasswordController.text !=
                            regController.passwordController.text) {
                          return "Passwords don't match!";
                        }
                        return null;
                      },
                    ),
                    SeePswdWidget(
                      see: () {
                        setState(() {
                          _repeatpasswordVisible = !_repeatpasswordVisible;
                        });
                      },
                    ),
                  ]),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 24,
              child: Center(
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        activeColor: CustomColor.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        onChanged: (val) {
                          setState(() {
                            isChecked = val!;
                          });
                        }),
                    Text(
                      "I agree with ",
                      style: TextStyles.SFProText14.copyWith(
                          color: CustomColor.gray, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      //width: 65,
                      child: RawMaterialButton(
                          onPressed: () {
                            _navigateToTermsPage(context);
                          },
                          child: Center(
                            child: Text(
                              "Terms of Service",
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
            const SizedBox(
              height: 48,
            ),
            /*ButtonWidget(
              btnText: "test",
              onpress:   (){regController.Register();_saveForm();},
            ),*/
            SizedBox(
              height: 52,
              child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  fillColor: CustomColor.green,
                  // onPressed: () {_navigateToHomePage(context);},
                  onPressed: () {
                    regController.Register();
                    _saveForm();
                    !regController.isRegistered && isChecked ?  _navigateToHomePage(context) : print("error");
                  },
                  child: Center(
                    child: Text(
                      "REGISTRATION",
                      style: TextStyles.SFProText14.copyWith(
                          color: CustomColor.whiteSolid,
                          height: 1.71,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToTermsPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TermsPage()));
  }void _navigateToHomePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginWidget()));
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
  }
}
