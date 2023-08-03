import 'package:anyideas/constants/image_path.dart';
import 'package:anyideas/constants/pallete.dart';
import 'package:flutter/material.dart';

class ImageSignInPage extends StatelessWidget {
  const ImageSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
            Positioned(
                child: Image(image: AssetImage(ImagePath.background_demo)),
            ),
            // Positioned(
            //     height: 300,
            //     child: Image(image: AssetImage(ImagePath.calender1)),
            // ),
            // Positioned(
            //     height: 300,
            //     child: Image(image: AssetImage(ImagePath.calender2)),
            // ),
        ],
    );
  }
}