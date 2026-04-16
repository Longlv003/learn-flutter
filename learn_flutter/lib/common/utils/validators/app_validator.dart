class AppValidator {
  static String? required(String? value, String error) {
    if (value == null || value.trim().isEmpty) {
      return error;
    }
    return null;
  }

  static String? email(String value, String error) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$');
    if (!regex.hasMatch(value.trim())) {
      return error;
    }
    return null;
  }
}
