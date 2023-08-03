import 'dart:math';

import 'package:anyideas/widgets/loginButton.dart';
import 'package:anyideas/widgets/loginField.dart';
import 'package:flutter/material.dart';

import '../widgets/signinImage.dart';

class LoginPage extends StatelessWidget {
  var ctr_email = TextEditingController();
  var ctr_password = TextEditingController();

  LoginPage({super.key});

  

  void signInOnPress(){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SignInImage(),
              const Text(
                'Sign In.', 
                style: TextStyle(fontSize: 50)
                ),
              const SizedBox(height: 40),
              LoginField(hintText: 'Email', ctr: ctr_email),
              const SizedBox(height: 20),
              LoginField(hintText: 'Password', ctr: ctr_password,),
              const SizedBox(height: 45),
              LoginButton(title: 'Sign In', onPressed: (){
                print('email: ${ctr_email.text}');
                print('password:  ${ctr_password.text}');
              })
            ],
          ),
        ),
      ),
    );
  }
}