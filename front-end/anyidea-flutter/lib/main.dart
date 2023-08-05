import 'package:anyideas/constants/pallete.dart';
import 'package:anyideas/models/account_user.dart';
import 'package:anyideas/pages/page_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserAccount().init();

    return MaterialApp(
      title: 'AnyIdea Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor
      ),
      home: const PageAuth(),
    );
  }
}
