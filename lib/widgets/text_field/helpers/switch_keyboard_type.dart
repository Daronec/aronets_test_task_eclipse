import 'package:aronets_test_task_eclipse/constants/constants.dart';
import 'package:flutter/material.dart';

TextInputType switchInputType(TextFieldType fieldType) {
  switch (fieldType) {
    case TextFieldType.phoneNumber:
      return TextInputType.phone;

    case TextFieldType.number:
      return TextInputType.number;

    default:
      return TextInputType.text;
  }
}
