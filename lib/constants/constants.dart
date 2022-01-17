enum TypeSnackBar {
  error,
  success,
  message,
}

enum TextFieldType {
  text,
  number,
  phoneNumber,
  email,
}

class Registers {
  static RegExp email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static RegExp number = RegExp("[0-9]");
}