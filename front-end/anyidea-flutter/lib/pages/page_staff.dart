import 'package:anyideas/models/account_user.dart';
import 'package:flutter/material.dart';

import '../constants/pallete.dart';

class PageStaff extends StatefulWidget {
  const PageStaff({super.key});

  @override
  State<PageStaff> createState() => _PageStaffState();
}

class _PageStaffState extends State<PageStaff> {
  var userId = UserAccount().name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: Text("Welcom $userId !!"),
      ),
    );
  }
}