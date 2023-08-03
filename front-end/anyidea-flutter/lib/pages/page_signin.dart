import 'package:anyideas/widgets/button_signin.dart';
import 'package:anyideas/widgets/inputfield_password.dart';
import 'package:anyideas/widgets/inputfield_userInfo.dart';
import 'package:flutter/material.dart';
import '../constants/image_path.dart';

class PageSignIn extends StatelessWidget {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _key = GlobalKey<FormState>();

  PageSignIn({super.key});

  _loginOnPressed(BuildContext context) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.linearToSrgbGamma(),
                  child: Image(image: AssetImage(ImagePath.background_demo)),
                ),
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
                InputFieldUserInfo(ctr: emailTextController),
                const SizedBox(height: 25),
                InputFieldPassword(ctr: passwordTextController),
                const SizedBox(height: 40),
                ButtonLogin(
                    title: 'Sign In',
                    onPressed: () {
                      _loginOnPressed(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
