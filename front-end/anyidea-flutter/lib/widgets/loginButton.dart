import 'dart:ui';

import 'package:anyideas/constants/pallete.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const LoginButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1,
            Pallete.gradient2,
            Pallete.gradient3,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(400, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17
          ),
        ),
      ),
    );
  }
}