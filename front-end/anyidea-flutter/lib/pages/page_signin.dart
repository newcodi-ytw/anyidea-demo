import 'dart:convert';

import 'package:anyideas/api/api_center.dart';
import 'package:anyideas/pages/page_auth.dart';
import 'package:anyideas/widgets/button_signin.dart';
import 'package:anyideas/widgets/inputfield_password.dart';
import 'package:anyideas/widgets/inputfield_userInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/image_path.dart';
import '../helpers/custom_snackbar.dart';

class PageSignIn extends StatefulWidget {
  const PageSignIn({super.key});

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> {
  final userIdTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool animated = true;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animated = !animated);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void initState() {
    // startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    gotoAuthPage(){
      Navigator.push(
              context, MaterialPageRoute(builder: (context) => const PageAuth()));
    }

    showMsg(msg){
      CustomSnackBar(context: context).show(msg);
    }

    loginOnPressed() async {
      if (formKey.currentState!.validate()) {
        var data = {
          'email': userIdTextController.text,
          'password': passwordTextController.text,
        };

        var res = await ApiCenter().requestLogin(data);
        var body = json.decode(res.body);
        print(body);
        if (body['success']) {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('token', body['token']);
          localStorage.setString('user', json.encode(body['user']));
          gotoAuthPage();
        } else {
          showMsg(body['message']);
        }
      } else {
        showMsg('Error: User ID or Password');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stack(children: [
              BackgroundImage(animated: animated, left: 200, top: -100, h: 200),
              BackgroundImage(animated: animated, left: 50, top: -10, h: 50),
              Column(
                children: [
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(height: 50, image: AssetImage(ImagePath.calender2)),
                      const SizedBox(
                        width: 50,
                      ),
                      const Text('AnyIdea.', style: TextStyle(fontSize: 50)),
                    ],
                  ),
                  const SizedBox(height: 25),
                  InputFieldUserInfo(ctr: userIdTextController),
                  const SizedBox(height: 5),
                  InputFieldPassword(ctr: passwordTextController),
                  const SizedBox(height: 50),
                  ButtonLogin(
                      title: 'Sign In',
                      onPressed: () {
                        loginOnPressed();
                      }),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage(
      {super.key,
      required this.animated,
      required this.top,
      required this.left,
      required this.h});

  final bool animated;
  final double top;
  final double left;
  final double h;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1500),
      top: animated ? 0 : top,
      left: animated ? 0 : left,
      height: h,
      child: Image(image: AssetImage(ImagePath.backgroundTop)),
    );
  }
}
