import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  ///
  ///
  /// In en, this message translates to:
  /// **'Loading app ...'**
  String get loadingApp;

  /// Welcome text shown on the main screen
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeMessage;

  /// Title for login screen
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get loginAccount;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Label for email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Label for password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Label for confirm password input
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPasswordLabel;

  /// Text prompting user to register
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Text prompting user to login
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Message shown when login succeeds
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccess;

  /// No description provided for @requiredEmail.
  ///
  /// In en, this message translates to:
  /// **'Required email'**
  String get requiredEmail;

  /// No description provided for @requiredPass.
  ///
  /// In en, this message translates to:
  /// **'Required password'**
  String get requiredPass;

  /// No description provided for @requiredEmailAndPass.
  ///
  /// In en, this message translates to:
  /// **'Required email and password'**
  String get requiredEmailAndPass;

  /// Message shown when login fails
  ///
  /// In en, this message translates to:
  /// **'Incorrect password'**
  String get loginFailed;

  /// Message shown when registration succeeds
  ///
  /// In en, this message translates to:
  /// **'Register successful'**
  String get registerSuccess;

  /// Validation message for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// Cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelText;

  /// Confirm
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmText;

  /// Delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteText;

  /// Title for delete product dialog
  ///
  /// In en, this message translates to:
  /// **'Delete product'**
  String get deleteProductTitle;

  /// Confirmation message before deleting product
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get deleteProductConfirmMessage;

  /// Message shown after product is deleted
  ///
  /// In en, this message translates to:
  /// **'Product deleted successfully'**
  String get deletedProductSuccess;

  /// Add product button/text
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get addProduct;

  /// Edit product button/text
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get editProduct;

  /// Screen title for product detail
  ///
  /// In en, this message translates to:
  /// **'Product details'**
  String get productDetail;

  /// Confirm add product action
  ///
  /// In en, this message translates to:
  /// **'Confirm add'**
  String get confirmAdd;

  /// Confirm update product action
  ///
  /// In en, this message translates to:
  /// **'Confirm update'**
  String get confirmUpdate;

  /// Message confirming adding product
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to add this product?'**
  String get confirmAddProductMessage;

  /// Message confirming updating product
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to update this product?'**
  String get confirmUpdateProductMessage;

  /// Add button
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Update button
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Product name label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Product price label
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// Product quantity label
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// Product image URL field
  ///
  /// In en, this message translates to:
  /// **'Image URL'**
  String get imageUrl;

  /// Product description field
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Product category field
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
