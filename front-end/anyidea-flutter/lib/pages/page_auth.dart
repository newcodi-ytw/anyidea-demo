
import 'package:anyideas/constants/data_types.dart';
import 'package:anyideas/models/account_user.dart';
import 'package:anyideas/pages/page_signin.dart';
import 'package:anyideas/pages/page_staff.dart';
import 'package:flutter/material.dart';

import '../constants/pallete.dart';

class PageAuth extends StatefulWidget {
  const PageAuth({super.key});

  @override
  State<PageAuth> createState() => _PageAuthState();
}

class _PageAuthState extends State<PageAuth> {
  bool _alreadyLoggedIn = false;
  AuthLevel _authLv = AuthLevel.root;

  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  _checkLoginStatus() async {
    var token = UserAccount().token;
    if (token != "NA") {
        setState(() {
          _alreadyLoggedIn = true;
        });
    }
    else
    {
      print("token not found!");
    }
  }

  _getAuthPage() {
    if (_alreadyLoggedIn) {
      _authLv = UserAccount().authlv;
      switch (_authLv) {
        case AuthLevel.root:
        case AuthLevel.owner:
        case AuthLevel.staff:
        case AuthLevel.client:
        {
            return const PageStaff();
        }
        default:
        {
            return const PageSignIn();
        }
      }
    }

    print("not logged in!");

    return const PageSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnyIdea Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor
      ),
      home: Scaffold(
        body: _getAuthPage(),
      ),
    );
  }
}
