import 'package:string_validator/string_validator.dart';

final namePattern =
    RegExp(r"^[a-zA-Z]([-'\s]?[a-zA-Z]+)*( [a-zA-Z]([-'\s]?[a-zA-Z]+)*)*$");

String? validateName(String? value) {
  String name = value ?? '';
  if (name.isEmpty) {
    return 'Name is required';
  }
  if (!namePattern.hasMatch(name)) {
    return 'Please enter a valid name';
  }

  return null;
}

String? validateEmail(String? value) {
  String email = value ?? '';
  if (email.isEmpty) {
    return null;
  }
  if (!isLength(email, 1) || !isEmail(email)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? validatePhone(String? value) {
  String phone = value ?? '';
  if (phone.isEmpty) {
    return "Phone number is required";
  }
  if (!isLength(phone, 5, 15)) {
    return 'Please enter a valid phone number';
  }

  return null;
}
