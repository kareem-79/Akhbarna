import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

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
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @welcome_title.
  ///
  /// In en, this message translates to:
  /// **'News World'**
  String get welcome_title;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, please sign in'**
  String get welcome_back;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get signup;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @name_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get name_required;

  /// No description provided for @name_min.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 6 characters long'**
  String get name_min;

  /// No description provided for @email_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get email_required;

  /// No description provided for @email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get email_invalid;

  /// No description provided for @password_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get password_required;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @otp_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter full OTP code'**
  String get otp_required;

  /// No description provided for @passwords_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_not_match;

  /// No description provided for @location_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your location'**
  String get location_required;

  /// No description provided for @profile_updated_success.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profile_updated_success;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search.....'**
  String get search;

  /// No description provided for @login_success.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get login_success;

  /// No description provided for @failed_login.
  ///
  /// In en, this message translates to:
  /// **'Failed to Login.'**
  String get failed_login;

  /// No description provided for @verify_account.
  ///
  /// In en, this message translates to:
  /// **'Verify account'**
  String get verify_account;

  /// No description provided for @option.
  ///
  /// In en, this message translates to:
  /// **'Option'**
  String get option;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get register;

  /// No description provided for @login_simple.
  ///
  /// In en, this message translates to:
  /// **' Login'**
  String get login_simple;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Sign up now'**
  String get register_now;

  /// No description provided for @or_login_with.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get or_login_with;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @login_with_email.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get login_with_email;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get login_with_google;

  /// No description provided for @login_with_facebook.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get login_with_facebook;

  /// No description provided for @no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get no_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @enter_code.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit verification code sent to your email'**
  String get enter_code;

  /// No description provided for @resend_code_in.
  ///
  /// In en, this message translates to:
  /// **'Resend code in'**
  String get resend_code_in;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get seconds;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resend_code;

  /// No description provided for @password_rule.
  ///
  /// In en, this message translates to:
  /// **'Minimum: 1 uppercase letter, 1 number, 1 special character, 8 characters'**
  String get password_rule;

  /// No description provided for @password_rule2.
  ///
  /// In en, this message translates to:
  /// **'Your password must be at least 8 characters long and must include a mix of numbers, letters, and special characters (!\$@%).'**
  String get password_rule2;

  /// No description provided for @password_changed.
  ///
  /// In en, this message translates to:
  /// **'Password has been changed'**
  String get password_changed;

  /// No description provided for @reset_password_instruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address to reset your password.'**
  String get reset_password_instruction;

  /// No description provided for @reset_password_note.
  ///
  /// In en, this message translates to:
  /// **'If this email is registered with us, you will receive a password reset message within minutes.'**
  String get reset_password_note;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @confirm_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirm_new_password;

  /// No description provided for @general_settings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get general_settings;

  /// No description provided for @account_management.
  ///
  /// In en, this message translates to:
  /// **'Account management'**
  String get account_management;

  /// No description provided for @account_information.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get account_information;

  /// No description provided for @security_settings.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security_settings;

  /// No description provided for @help_center.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get help_center;

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About Akhbarna'**
  String get about_us;

  /// No description provided for @lang_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get lang_english;

  /// No description provided for @lang_arabic.
  ///
  /// In en, this message translates to:
  /// **'العربيه'**
  String get lang_arabic;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get light_mode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @font_size.
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get font_size;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get edit_profile;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get save_changes;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// No description provided for @extra_large.
  ///
  /// In en, this message translates to:
  /// **'Extra Large'**
  String get extra_large;

  /// No description provided for @change_sources.
  ///
  /// In en, this message translates to:
  /// **'Edit News Sources'**
  String get change_sources;

  /// No description provided for @auto_simple.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto_simple;

  /// No description provided for @auto_device.
  ///
  /// In en, this message translates to:
  /// **'Automatic (Device Settings)'**
  String get auto_device;

  /// No description provided for @onboarding_title1.
  ///
  /// In en, this message translates to:
  /// **'Stay connected to the world from the heart of your country.'**
  String get onboarding_title1;

  /// No description provided for @onboarding_desc1.
  ///
  /// In en, this message translates to:
  /// **'Get the latest news from trusted sources.'**
  String get onboarding_desc1;

  /// No description provided for @onboarding_title2.
  ///
  /// In en, this message translates to:
  /// **'Every news that matters to you,delivered quickly.'**
  String get onboarding_title2;

  /// No description provided for @onboarding_desc2.
  ///
  /// In en, this message translates to:
  /// **'All details at your fingertips.'**
  String get onboarding_desc2;

  /// No description provided for @onboarding_title3.
  ///
  /// In en, this message translates to:
  /// **'Experience news with an authentic Arabic touch.'**
  String get onboarding_title3;

  /// No description provided for @onboarding_desc3.
  ///
  /// In en, this message translates to:
  /// **'Real news from the stree  with true perspective.'**
  String get onboarding_desc3;

  /// No description provided for @onboarding_title4.
  ///
  /// In en, this message translates to:
  /// **'From art to politics, everything in “Akhbarna”.'**
  String get onboarding_title4;

  /// No description provided for @onboarding_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboarding_skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @choose_language.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get choose_language;

  /// No description provided for @fav_language.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language below. This helps us serve you better.'**
  String get fav_language;

  /// No description provided for @choose_interests.
  ///
  /// In en, this message translates to:
  /// **'Choose your interests'**
  String get choose_interests;

  /// No description provided for @choose_interests_desc.
  ///
  /// In en, this message translates to:
  /// **'Select topics you like and let Akhbarna deliver the most relevant news for you. Choose at least 3.'**
  String get choose_interests_desc;

  /// No description provided for @select_min_3_interests.
  ///
  /// In en, this message translates to:
  /// **'Select at least 3 interests'**
  String get select_min_3_interests;

  /// No description provided for @account_ready.
  ///
  /// In en, this message translates to:
  /// **'Your account is ready,'**
  String get account_ready;

  /// No description provided for @lets_start.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get started!'**
  String get lets_start;

  /// No description provided for @agree_to.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get agree_to;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **' Terms & Conditions '**
  String get terms_and_conditions;

  /// No description provided for @privacy_policy_and_pricing.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy and Pricing'**
  String get privacy_policy_and_pricing;

  /// No description provided for @discover_news.
  ///
  /// In en, this message translates to:
  /// **'Discover news'**
  String get discover_news;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selected;

  /// No description provided for @all_languages.
  ///
  /// In en, this message translates to:
  /// **'All languages'**
  String get all_languages;

  /// No description provided for @step_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get step_continue;

  /// No description provided for @search_country.
  ///
  /// In en, this message translates to:
  /// **'Search your country'**
  String get search_country;

  /// No description provided for @search_sources.
  ///
  /// In en, this message translates to:
  /// **'Search news sources'**
  String get search_sources;

  /// No description provided for @choose_sources.
  ///
  /// In en, this message translates to:
  /// **'Choose news sources'**
  String get choose_sources;

  /// No description provided for @select_min_interests.
  ///
  /// In en, this message translates to:
  /// **'Select at least 1 interest'**
  String get select_min_interests;

  /// No description provided for @choose_country.
  ///
  /// In en, this message translates to:
  /// **'Choose your country'**
  String get choose_country;

  /// No description provided for @please_select_country.
  ///
  /// In en, this message translates to:
  /// **'Please select a country'**
  String get please_select_country;

  /// No description provided for @terms_1_title.
  ///
  /// In en, this message translates to:
  /// **'App Usage'**
  String get terms_1_title;

  /// No description provided for @terms_1_desc.
  ///
  /// In en, this message translates to:
  /// **'This application provides news and media content. You agree to use it only for lawful purposes and not to misuse the service.'**
  String get terms_1_desc;

  /// No description provided for @terms_2_title.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get terms_2_title;

  /// No description provided for @terms_2_desc.
  ///
  /// In en, this message translates to:
  /// **'We respect your privacy and are committed to protecting your personal data. Information is used only to improve user experience.'**
  String get terms_2_desc;

  /// No description provided for @terms_3_title.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get terms_3_title;

  /// No description provided for @terms_3_desc.
  ///
  /// In en, this message translates to:
  /// **'We may collect limited data such as device information to improve performance. All data is stored securely.'**
  String get terms_3_desc;

  /// No description provided for @terms_4_title.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get terms_4_title;

  /// No description provided for @terms_4_desc.
  ///
  /// In en, this message translates to:
  /// **'News and articles are collected from different sources. We are not fully responsible for the accuracy of external content.'**
  String get terms_4_desc;

  /// No description provided for @terms_5_title.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get terms_5_title;

  /// No description provided for @terms_5_desc.
  ///
  /// In en, this message translates to:
  /// **'We may update these terms from time to time. Important changes will be communicated within the app.'**
  String get terms_5_desc;

  /// No description provided for @terms_6_title.
  ///
  /// In en, this message translates to:
  /// **'Agreement'**
  String get terms_6_title;

  /// No description provided for @terms_6_desc.
  ///
  /// In en, this message translates to:
  /// **'By using this application, you agree to all terms and conditions stated above.'**
  String get terms_6_desc;

  /// No description provided for @logout_confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logout_confirm_title;

  /// No description provided for @logout_confirm_message.
  ///
  /// In en, this message translates to:
  /// **'You will need to login again.'**
  String get logout_confirm_message;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @about_app_title.
  ///
  /// In en, this message translates to:
  /// **'About Akhbarna'**
  String get about_app_title;

  /// No description provided for @about_app_description.
  ///
  /// In en, this message translates to:
  /// **'Akhbarna is a modern news platform that aims to deliver news in a fast, reliable, and easily accessible way.'**
  String get about_app_description;

  /// No description provided for @about_app_coverage.
  ///
  /// In en, this message translates to:
  /// **'We are committed to covering the most important local and international events across various fields such as politics, economy, sports, and technology.'**
  String get about_app_coverage;

  /// No description provided for @about_app_experience.
  ///
  /// In en, this message translates to:
  /// **'The app features a simple and smooth user experience that allows users to follow the news anytime and anywhere, with real-time updates on the most important ongoing events.'**
  String get about_app_experience;

  /// No description provided for @our_goal.
  ///
  /// In en, this message translates to:
  /// **'Our Goal'**
  String get our_goal;

  /// No description provided for @goal_1.
  ///
  /// In en, this message translates to:
  /// **'Provide accurate and trustworthy news content'**
  String get goal_1;

  /// No description provided for @goal_2.
  ///
  /// In en, this message translates to:
  /// **'Simplify access to information for users'**
  String get goal_2;

  /// No description provided for @goal_3.
  ///
  /// In en, this message translates to:
  /// **'Present news in an organized and easy-to-read format'**
  String get goal_3;

  /// No description provided for @goal_4.
  ///
  /// In en, this message translates to:
  /// **'Keep up with events as they happen, moment by moment'**
  String get goal_4;

  /// No description provided for @app_features.
  ///
  /// In en, this message translates to:
  /// **'App Features'**
  String get app_features;

  /// No description provided for @feature_1.
  ///
  /// In en, this message translates to:
  /// **'Continuous news updates'**
  String get feature_1;

  /// No description provided for @feature_2.
  ///
  /// In en, this message translates to:
  /// **'Diverse news categories'**
  String get feature_2;

  /// No description provided for @feature_3.
  ///
  /// In en, this message translates to:
  /// **'Fast and easy-to-use interface'**
  String get feature_3;

  /// No description provided for @feature_4.
  ///
  /// In en, this message translates to:
  /// **'News search capability'**
  String get feature_4;

  /// No description provided for @feature_5.
  ///
  /// In en, this message translates to:
  /// **'Comfortable reading experience'**
  String get feature_5;

  /// No description provided for @our_vision.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get our_vision;

  /// No description provided for @vision_description.
  ///
  /// In en, this message translates to:
  /// **'We aspire to become a trusted source for daily news, helping users stay informed about everything happening around them in a simple and effective way.'**
  String get vision_description;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'ja',
    'ko',
    'nl',
    'pt',
    'ru',
    'sv',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
