import 'package:learn_flutter/common/utils/validators/app_validator.dart';

class LoginValidator {
  static String? validate(String email, String pass) {
    if (email.trim().isEmpty && pass.trim().isEmpty) {
      return "REQUIRED";
    }
    final emailRequired = AppValidator.required(email, "REQUIRED_EMAIL");
    if (emailRequired != null) return emailRequired;

    final passRequired = AppValidator.required(pass, "REQUIRED_PASS");
    if (passRequired != null) return passRequired;

    final emailFormat = AppValidator.email(email, "INVALID_EMAIL");
    if (emailFormat != null) return emailFormat;

    return null;
  }
}
