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

class RegisterValidator {
  static String? validate(String email, String pass, String confirmPass) {
    if (email.trim().isEmpty &&
        pass.trim().isEmpty &&
        confirmPass.trim().isEmpty) {
      return "REQUIRED";
    }

    final emailRequired = AppValidator.required(email, "REQUIRED_EMAIL");
    if (emailRequired != null) return emailRequired;

    final passRequired = AppValidator.required(pass, "REQUIRED_PASS");
    if (passRequired != null) return passRequired;

    final confirmPassRequired = AppValidator.required(
      pass,
      "REQUIRED_CONFIRM_PASS",
    );
    if (confirmPassRequired != null) return confirmPassRequired;

    final emailFormat = AppValidator.email(email, "INVALID_EMAIL");
    if (emailFormat != null) return emailFormat;

    if (pass.trim() != confirmPass.trim()) return "CONFIRM_PASS_FAILED";

    return null;
  }
}
