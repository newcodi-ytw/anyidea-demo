import 'package:anyideas/constants/pallete.dart';
import 'package:flutter/material.dart';

class SignInImage extends StatelessWidget {
  const SignInImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Pallete.imageMaskColor,
        BlendMode.modulate
      ),
      child: Image.asset('assets/images/bg_signin.png'),
    );
  }
}