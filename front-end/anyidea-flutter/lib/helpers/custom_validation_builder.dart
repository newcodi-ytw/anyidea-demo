import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../constants/pallete.dart';

extension CustomValidationBuilder on ValidationBuilder {
  password() => minLength(5).maxLength(10).add(
        (value) {
          /* custom validation */
          return null;
        },
      ).build();

  userInfo() => minLength(5).maxLength(10).add(
        (value) {
          /* custom validation */
          return null;
        },
      ).build();
}
