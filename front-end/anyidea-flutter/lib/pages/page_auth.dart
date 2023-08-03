
import 'package:anyideas/constants/data_types.dart';
import 'package:anyideas/pages/page_signin.dart';
import 'package:anyideas/pages/page_staff.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageAuth extends StatefulWidget {
  const PageAuth({super.key});

  @override
  State<PageAuth> createState() => _PageAuthState();
}

class _PageAuthState extends State<PageAuth> {
  bool _isLoggedIn = false;
  AuthLevel _authLv = AuthLevel.root;

  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  _checkLoginStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var token = sp.getString('token');
    if (token != null) {
        setState(() {
            _isLoggedIn = true;
            _authLv = sp.getInt('authlv') as AuthLevel;
        });
    } else {
        //ask from server
        print("not logged in!");
    }
  }

  _getAuthPage() {
    if (_isLoggedIn) {
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
            return PageSignIn();
        }
      }
    }

    return PageSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return _getAuthPage();
  }
}
