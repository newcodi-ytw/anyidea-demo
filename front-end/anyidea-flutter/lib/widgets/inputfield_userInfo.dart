import 'package:anyideas/helpers/custom_validation_builder.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'outline_border.dart';

class InputFieldUserInfo extends StatelessWidget {
  final TextEditingController ctr;
  final String hintText = "User ID";
  final bool obscureText = false;

  const InputFieldUserInfo({
    super.key,
    required this.ctr,
  });

  @override
  Widget build(BuildContext context) {
    ctr.text = "Dummy Tester";
    
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: SizedBox(
        height: 90,
        child: TextFormField(
          validator: ValidationBuilder().userInfo(),
          controller: ctr,
          decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 15, height: 0.7),
              prefixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.supervised_user_circle)),
              contentPadding: const EdgeInsets.all(25),
              border: OutlineBorder(type: BorderType.inactive).build(),
              enabledBorder: OutlineBorder(type: BorderType.inactive).build(),
              focusedBorder: OutlineBorder(type: BorderType.active).build(),
              errorBorder: OutlineBorder(type: BorderType.error).build(),
              hintText: hintText),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
