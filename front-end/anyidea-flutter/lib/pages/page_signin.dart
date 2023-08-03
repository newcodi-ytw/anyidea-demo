import 'package:anyideas/widgets/button_signin.dart';
import 'package:anyideas/widgets/inputfield_password.dart';
import 'package:anyideas/widgets/inputfield_userInfo.dart';
import 'package:flutter/material.dart';

import '../widgets/image_for_signin.dart';

class PageSignIn extends StatelessWidget {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _key = GlobalKey<FormState>();

  PageSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const ImageSignInPage(),
                const Text('AnyIdea.', style: TextStyle(fontSize: 50)),
                const SizedBox(height: 40),
                InputFieldUserInfo(ctr: emailTextController),
                const SizedBox(height: 20),
                InputFieldPassword(ctr: passwordTextController),
                const SizedBox(height: 40),
                ButtonLogin(
                    title: 'Sign In',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        print('User ID: ${emailTextController.text}');
                        print('password:  ${passwordTextController.text}');
                      } else {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(child: Text('Error: User ID or Password')),
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
