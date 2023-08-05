import 'package:anyideas/helpers/custom_validation_builder.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'outline_border.dart';

class InputFieldPassword extends StatefulWidget {
  final TextEditingController ctr;
  const InputFieldPassword({super.key, required this.ctr});

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  final String hintText = "Password";
  bool visibility = false;

  @override
  void initState() {
    widget.ctr.text = "pw_123";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: SizedBox(
        height: 90,
        child: TextFormField(
          validator: ValidationBuilder().password(),
          controller: widget.ctr,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white24,
              errorStyle: const TextStyle(
                fontSize: 15,
                height: 0.7
                ),
              prefixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.key)),
              suffixIcon: IconButton(
                hoverColor: Colors.transparent,
                padding: const EdgeInsets.all(10),
                icon: Icon(
                    visibility ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
              ),
              contentPadding: const EdgeInsets.all(25),
              border: OutlineBorder(type: BorderType.inactive).build(),
              enabledBorder: OutlineBorder(type: BorderType.inactive).build(),
              focusedBorder: OutlineBorder(type: BorderType.active).build(),
              errorBorder: OutlineBorder(type: BorderType.error).build(),
              hintText: hintText),
          obscureText: !visibility,
        ),
      ),
    );
  }
}
