import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:flutter/material.dart';

String? switchValidation(
  BuildContext context,
  TextFieldType fieldType,
  String value,
) {
  switch (fieldType) {
    case TextFieldType.phoneNumber:
      if (value.isEmpty) {
        return "Заполните поле";
      } else if (value.length < 16) {
        return "Телефон указан не полностью";
      }
      break;
    case TextFieldType.number:
      if (value.isEmpty) {
        return "Заполните поле";
      }
      break;
    case TextFieldType.email:
      if (!Registers.email.hasMatch(value)) return 'E-mail введён не верно';
      return null;
    default:
      if (value.isEmpty) {
        return null;
      }
      break;
  }
  return null;
}
