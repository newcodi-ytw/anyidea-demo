import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
    password() => minLength(5).maxLength(10).build();
    userInfo() => minLength(5).maxLength(10).build();
}