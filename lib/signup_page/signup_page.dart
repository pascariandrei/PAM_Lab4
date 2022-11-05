import 'package:flutter/material.dart';
import 'package:flutter_shop/login_page/widgets/button_widget.dart';
import 'package:flutter_shop/login_page/widgets/input_widget.dart';
import 'package:flutter_shop/login_page/widgets/title_widget.dart';
import 'package:flutter_shop/models/registration_post.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
              child: SizedBox(
                height: 44,
                child:  TextFormField(
                  controller: regController.fullnameController,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (check) {
                    if (check?.isEmpty == true   ) {
                      return "Enter valid name of more then 5 characters!";
                    }
                    return null;
                  },
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
                    hintText: "FullName",
                    contentPadding: const EdgeInsets.symmetric( horizontal: 16),

                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
              InputWidget(hintText: "Email",textController:regController.emailController),
              SizedBox(
              height: 16,
            ),
              InputWidget(hintText: "Phone",textController:regController.phonenumController),
            const SizedBox(
              height: 16,
            ),
            Stack(children: [
              InputWidget(hintText: "Password", isPassword:!_passwordVisible,textController:regController.passwordController,),
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
              height: 16,
            ),
            Stack(children: [
              InputWidget(hintText: "Repeat Password", isPassword:!_repeatpasswordVisible,textController:regController.repeatpasswordController),
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
              height: 22,
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
              btnText: "REGISTRATION",
              test: (){print(emailController.text);},
            ),*/
            SizedBox(
              height: 52,
              child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  fillColor: CustomColor.green,
                  // onPressed: () {_navigateToHomePage(context);},
                  onPressed: (){regController.SaveProducts();_saveForm();},
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
  }
  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
  }
}
