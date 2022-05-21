import 'package:fast_ui/views/pages/signup/util/signup_constants.dart';

class SignupValidation {
  //validate for email
  bool isEmail(String str) {
    RegExp _email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    return _email.hasMatch(str.toLowerCase());
  }

  // Check username Validation
  String? checkUserNameValidation(value) {
    if (value.isEmpty) {
      return SignupFont().fullNameRequired;
    } else {
      return null;
    }
  }

  //validate for password
  bool isPassword(String str) {
    RegExp _pwd = RegExp(r"^(?:(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*)$");
    return _pwd.hasMatch(str);
  }

  // Check Id Validation
  String? checkIDValidation(value) {
    if (value.isEmpty) {
      return SignupFont().emailNameRequired;
    } else if (SignupValidation().isEmail(value) == false) {
      return SignupFont().inCorrectUsername;
    } else {
      return null;
    }
  }

  // Check Password Validation
  String? checkPasswordValidation(value) {
    if (value.isEmpty) {
      return SignupFont().passwordNameRequired;
    } else if (value.length <= 5) {
      return SignupFont().passwordMininumValueEnter;
    } else {
      return null;
    }
  }
}
