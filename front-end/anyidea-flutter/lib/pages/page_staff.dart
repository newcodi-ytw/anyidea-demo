import 'package:flutter/material.dart';

import '../constants/pallete.dart';

class PageStaff extends StatefulWidget {
  const PageStaff({super.key});

  @override
  State<PageStaff> createState() => _PageStaffState();
}

class _PageStaffState extends State<PageStaff> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: Text("Welcom Staff Page!"),
      ),
    );
  }
}