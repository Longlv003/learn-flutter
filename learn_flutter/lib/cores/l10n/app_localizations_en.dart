// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loadingApp => 'Loading app ...';

  @override
  String get welcomeMessage => 'Welcome';

  @override
  String get loginAccount => 'Login to your account';

  @override
  String get login => 'Login';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get register => 'Register';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Confirm password';

  @override
  String get enterEmailHint => 'Enter email';

  @override
  String get enterPasswordHint => 'Enter password';

  @override
  String get enterConfirmPasswordHint => 'Re-enter password';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get loginSuccess => 'Login successful';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get registerSuccess => 'Register successful';

  @override
  String get registerFailed => 'Register failed';

  @override
  String get requiredField => 'This field is required';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get passwordTooShort => 'Password is too short';

  @override
  String get cancelText => 'Cancel';

  @override
  String get confirmText => 'Confirm';

  @override
  String get deleteText => 'Delete';

  @override
  String get deleteProductTitle => 'Delete product';

  @override
  String get deleteProductConfirmMessage =>
      'Are you sure you want to delete this product?';

  @override
  String get deletedProductSuccess => 'Product deleted successfully';

  @override
  String get addProduct => 'Add product';

  @override
  String get editProduct => 'Edit product';

  @override
  String get productDetail => 'Product details';

  @override
  String get confirmAdd => 'Confirm add';

  @override
  String get confirmUpdate => 'Confirm update';

  @override
  String get confirmAddProductMessage =>
      'Are you sure you want to add this product?';

  @override
  String get confirmUpdateProductMessage =>
      'Are you sure you want to update this product?';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String get name => 'Name';

  @override
  String get price => 'Price';

  @override
  String get quantity => 'Quantity';

  @override
  String get imageUrl => 'Image URL';

  @override
  String get description => 'Description';

  @override
  String get category => 'Category';
}
