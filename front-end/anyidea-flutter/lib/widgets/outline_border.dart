import 'package:flutter/material.dart';
import '../constants/pallete.dart';

enum BorderType { inactive, active, error }

class OutlineBorder {
  final BorderType type;
  OutlineBorder({required this.type});

  build() {
    switch (type) {
      case BorderType.active:
        {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.gradient2, width: 3),
            borderRadius: BorderRadius.circular(10),
          );
        }
      case BorderType.inactive:
        {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.borderColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          );
        }
      case BorderType.error:
        {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.errorColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          );
        }
      default:
        {
          return OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Pallete.borderColor, width: 3),
              borderRadius: BorderRadius.circular(10));
        }
    }
  }
}
