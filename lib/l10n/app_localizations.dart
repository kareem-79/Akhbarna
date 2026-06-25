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
  /// **'The World in One News'**
  String get welcome_title;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back, Sign In'**
  String get welcome_back;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get signup;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
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

  /// No description provided for @name_min.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 6 characters'**
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
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @verify_account.
  ///
  /// In en, this message translates to:
  /// **'Verify Account'**
  String get verify_account;

  /// No description provided for @login_success.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get login_success;

  /// No description provided for @failed_login.
  ///
  /// In en, this message translates to:
  /// **'Failed to login.'**
  String get failed_login;

  /// No description provided for @otp_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter the complete verification code'**
  String get otp_required;

  /// No description provided for @passwords_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_not_match;

  /// No description provided for @or_login_with.
  ///
  /// In en, this message translates to:
  /// **'Or login with'**
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

  /// No description provided for @option.
  ///
  /// In en, this message translates to:
  /// **'Option'**
  String get option;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @login_simple.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_simple;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get register_now;

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

  /// No description provided for @create_account_success.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get create_account_success;

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
  /// **'sec'**
  String get seconds;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resend_code;

  /// No description provided for @reset_password_instruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address to reset your password.'**
  String get reset_password_instruction;

  /// No description provided for @reset_password_note.
  ///
  /// In en, this message translates to:
  /// **'If this email is registered with us, you will receive a password reset email within minutes.'**
  String get reset_password_note;

  /// No description provided for @password_rule.
  ///
  /// In en, this message translates to:
  /// **'Minimum: 1 uppercase letter, 1 number, 1 symbol, 8 characters'**
  String get password_rule;

  /// No description provided for @password_rule2.
  ///
  /// In en, this message translates to:
  /// **'Your password must be at least 8 characters long and include a combination of numbers, letters, and special symbols (!\$@%)'**
  String get password_rule2;

  /// No description provided for @password_changed.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get password_changed;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @confirm_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirm_new_password;

  /// No description provided for @general_settings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get general_settings;

  /// No description provided for @account_management.
  ///
  /// In en, this message translates to:
  /// **'Account Management'**
  String get account_management;

  /// No description provided for @account_information.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get account_information;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

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
  /// **'Arabic'**
  String get lang_arabic;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get light_mode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @font_size.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get font_size;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

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
  /// **'Change News Sources'**
  String get change_sources;

  /// No description provided for @auto_simple.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get auto_simple;

  /// No description provided for @auto_device.
  ///
  /// In en, this message translates to:
  /// **'Automatic (Device Settings)'**
  String get auto_device;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get save_changes;

  /// No description provided for @security_settings.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security_settings;

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
  /// **'Every news story that matters to you, delivered quickly.'**
  String get onboarding_title2;

  /// No description provided for @onboarding_desc2.
  ///
  /// In en, this message translates to:
  /// **'All the details at your fingertips.'**
  String get onboarding_desc2;

  /// No description provided for @onboarding_title3.
  ///
  /// In en, this message translates to:
  /// **'Experience authentic Arabic news.'**
  String get onboarding_title3;

  /// No description provided for @onboarding_desc3.
  ///
  /// In en, this message translates to:
  /// **'News straight from the streets with real stories.'**
  String get onboarding_desc3;

  /// No description provided for @onboarding_title4.
  ///
  /// In en, this message translates to:
  /// **'From entertainment to politics, everything is on Akhbarna.'**
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

  /// No description provided for @fav_language.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language below. This helps us serve you better.'**
  String get fav_language;

  /// No description provided for @choose_interests.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Interests'**
  String get choose_interests;

  /// No description provided for @choose_interests_desc.
  ///
  /// In en, this message translates to:
  /// **'Choose the topics you love and let Akhbarna deliver the most important news for you. Select at least 3.'**
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
  /// **'Let\'s Get Started!'**
  String get lets_start;

  /// No description provided for @agree_to.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get agree_to;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **' Terms and Conditions '**
  String get terms_and_conditions;

  /// No description provided for @privacy_policy_and_pricing.
  ///
  /// In en, this message translates to:
  /// **'and Privacy Policy'**
  String get privacy_policy_and_pricing;

  /// No description provided for @discover_news.
  ///
  /// In en, this message translates to:
  /// **'Discover News'**
  String get discover_news;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'You Selected'**
  String get selected;

  /// No description provided for @all_languages.
  ///
  /// In en, this message translates to:
  /// **'All Languages'**
  String get all_languages;

  /// No description provided for @step_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get step_continue;

  /// No description provided for @choose_language.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get choose_language;

  /// No description provided for @search_country.
  ///
  /// In en, this message translates to:
  /// **'Search for your country'**
  String get search_country;

  /// No description provided for @search_sources.
  ///
  /// In en, this message translates to:
  /// **'Search news sources'**
  String get search_sources;

  /// No description provided for @choose_sources.
  ///
  /// In en, this message translates to:
  /// **'Choose News Sources'**
  String get choose_sources;

  /// No description provided for @select_min_interests.
  ///
  /// In en, this message translates to:
  /// **'Select at least one interest'**
  String get select_min_interests;

  /// No description provided for @choose_country.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Country'**
  String get choose_country;

  /// No description provided for @please_select_country.
  ///
  /// In en, this message translates to:
  /// **'Please select a country'**
  String get please_select_country;

  /// No description provided for @terms_1_title.
  ///
  /// In en, this message translates to:
  /// **'Using the Application'**
  String get terms_1_title;

  /// No description provided for @terms_1_desc.
  ///
  /// In en, this message translates to:
  /// **'This application provides news and media content. By using the application, you agree to use it legally and not misuse it.'**
  String get terms_1_desc;

  /// No description provided for @terms_2_title.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get terms_2_title;

  /// No description provided for @terms_2_desc.
  ///
  /// In en, this message translates to:
  /// **'We respect your privacy and are committed to protecting your personal data. Information is used only to improve the user experience.'**
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
  /// **'News and articles are collected from various sources. We are not fully responsible for the accuracy of external content.'**
  String get terms_4_desc;

  /// No description provided for @terms_5_title.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get terms_5_title;

  /// No description provided for @terms_5_desc.
  ///
  /// In en, this message translates to:
  /// **'We may update these terms from time to time, and users will be informed of important changes within the application.'**
  String get terms_5_desc;

  /// No description provided for @terms_6_title.
  ///
  /// In en, this message translates to:
  /// **'Agreement'**
  String get terms_6_title;

  /// No description provided for @terms_6_desc.
  ///
  /// In en, this message translates to:
  /// **'By using this application, you agree to all the terms and conditions mentioned above.'**
  String get terms_6_desc;

  /// No description provided for @logout_confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logout_confirm_title;

  /// No description provided for @logout_confirm_message.
  ///
  /// In en, this message translates to:
  /// **'You will need to sign in again.'**
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
  /// **'About Akhbarna App'**
  String get about_app_title;

  /// No description provided for @about_app_description.
  ///
  /// In en, this message translates to:
  /// **'Akhbarna is a modern news platform that aims to deliver news quickly, reliably, and conveniently.'**
  String get about_app_description;

  /// No description provided for @about_app_coverage.
  ///
  /// In en, this message translates to:
  /// **'We strive to cover the most important local and international events in various fields such as politics, economy, sports, and technology.'**
  String get about_app_coverage;

  /// No description provided for @about_app_experience.
  ///
  /// In en, this message translates to:
  /// **'The application provides a simple and smooth user experience that enables users to follow news anytime and anywhere, with real-time updates on important events.'**
  String get about_app_experience;

  /// No description provided for @our_goal.
  ///
  /// In en, this message translates to:
  /// **'Our Goal'**
  String get our_goal;

  /// No description provided for @goal_1.
  ///
  /// In en, this message translates to:
  /// **'Provide accurate and reliable news content'**
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
  /// **'Keep up with events as they happen'**
  String get goal_4;

  /// No description provided for @app_features.
  ///
  /// In en, this message translates to:
  /// **'Application Features'**
  String get app_features;

  /// No description provided for @feature_1.
  ///
  /// In en, this message translates to:
  /// **'Continuous news updates'**
  String get feature_1;

  /// No description provided for @feature_2.
  ///
  /// In en, this message translates to:
  /// **'Various news categories'**
  String get feature_2;

  /// No description provided for @feature_3.
  ///
  /// In en, this message translates to:
  /// **'Simple and fast user interface'**
  String get feature_3;

  /// No description provided for @feature_4.
  ///
  /// In en, this message translates to:
  /// **'Ability to search for news'**
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
  /// **'We aspire to become a trusted source of daily news and help users stay informed about everything happening around them in a simple and effective way.'**
  String get vision_description;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @time_minute.
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get time_minute;

  /// No description provided for @time_hour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get time_hour;

  /// No description provided for @time_day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get time_day;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @failed_register.
  ///
  /// In en, this message translates to:
  /// **'Failed to register'**
  String get failed_register;

  /// No description provided for @failed_save_token.
  ///
  /// In en, this message translates to:
  /// **'Failed to save token'**
  String get failed_save_token;

  /// No description provided for @failed_get_token.
  ///
  /// In en, this message translates to:
  /// **'Failed to get token'**
  String get failed_get_token;

  /// No description provided for @bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarks;

  /// No description provided for @no_articles_yet.
  ///
  /// In en, this message translates to:
  /// **'No articles yet'**
  String get no_articles_yet;

  /// No description provided for @save_favorite_articles.
  ///
  /// In en, this message translates to:
  /// **'Save your favorite articles and be\nthe first to read them anytime'**
  String get save_favorite_articles;

  /// No description provided for @browse_news_to_save.
  ///
  /// In en, this message translates to:
  /// **'Browse news to save'**
  String get browse_news_to_save;

  /// No description provided for @failed_load_matches.
  ///
  /// In en, this message translates to:
  /// **'Failed to load matches'**
  String get failed_load_matches;

  /// No description provided for @failed_load_category_news.
  ///
  /// In en, this message translates to:
  /// **'Failed to load category news'**
  String get failed_load_category_news;

  /// No description provided for @good_morning_news.
  ///
  /// In en, this message translates to:
  /// **'Good Morning\nHere are some news updates'**
  String get good_morning_news;

  /// No description provided for @no_news_for_category.
  ///
  /// In en, this message translates to:
  /// **'No news available for this category'**
  String get no_news_for_category;

  /// No description provided for @available_news_count.
  ///
  /// In en, this message translates to:
  /// **'News Available'**
  String get available_news_count;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// No description provided for @politics.
  ///
  /// In en, this message translates to:
  /// **'Politics'**
  String get politics;

  /// No description provided for @economy.
  ///
  /// In en, this message translates to:
  /// **'Economy'**
  String get economy;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainment;

  /// No description provided for @science.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get science;

  /// No description provided for @world.
  ///
  /// In en, this message translates to:
  /// **'World'**
  String get world;

  /// No description provided for @failed_load_weather.
  ///
  /// In en, this message translates to:
  /// **'Failed to load weather'**
  String get failed_load_weather;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @failed_load_breaking_news.
  ///
  /// In en, this message translates to:
  /// **'Failed to load breaking news'**
  String get failed_load_breaking_news;

  /// No description provided for @failed_load_most_read_news.
  ///
  /// In en, this message translates to:
  /// **'Failed to load most read news'**
  String get failed_load_most_read_news;

  /// No description provided for @failed_load_latest_news.
  ///
  /// In en, this message translates to:
  /// **'Failed to load latest news'**
  String get failed_load_latest_news;

  /// No description provided for @failed_load_trending_news.
  ///
  /// In en, this message translates to:
  /// **'Failed to load trending news'**
  String get failed_load_trending_news;

  /// No description provided for @failed_search_articles.
  ///
  /// In en, this message translates to:
  /// **'Failed to search articles'**
  String get failed_search_articles;

  /// No description provided for @keyword.
  ///
  /// In en, this message translates to:
  /// **'Keyword'**
  String get keyword;

  /// No description provided for @top.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get top;

  /// No description provided for @no_notifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get no_notifications;

  /// No description provided for @top_matches.
  ///
  /// In en, this message translates to:
  /// **'⚽ Top Matches'**
  String get top_matches;

  /// No description provided for @trending_news.
  ///
  /// In en, this message translates to:
  /// **'🔥 Trending News'**
  String get trending_news;

  /// No description provided for @latest_news.
  ///
  /// In en, this message translates to:
  /// **'🕐 Latest News'**
  String get latest_news;

  /// No description provided for @most_read_news.
  ///
  /// In en, this message translates to:
  /// **'📖 Most Read'**
  String get most_read_news;

  /// No description provided for @english_short.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get english_short;

  /// No description provided for @read_full_article.
  ///
  /// In en, this message translates to:
  /// **'Read Full Article'**
  String get read_full_article;

  /// No description provided for @share_article_text.
  ///
  /// In en, this message translates to:
  /// **'Read this article on Akhbarna News App'**
  String get share_article_text;

  /// No description provided for @international.
  ///
  /// In en, this message translates to:
  /// **'International'**
  String get international;

  /// No description provided for @most_read.
  ///
  /// In en, this message translates to:
  /// **'Most Read'**
  String get most_read;

  /// No description provided for @most_trending.
  ///
  /// In en, this message translates to:
  /// **'Most Trending'**
  String get most_trending;

  /// No description provided for @trend.
  ///
  /// In en, this message translates to:
  /// **'Trend'**
  String get trend;

  /// No description provided for @breaking.
  ///
  /// In en, this message translates to:
  /// **'Breaking'**
  String get breaking;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @sources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sources;

  /// No description provided for @ago.
  ///
  /// In en, this message translates to:
  /// **'Ago'**
  String get ago;

  /// No description provided for @thousand_short.
  ///
  /// In en, this message translates to:
  /// **'K'**
  String get thousand_short;

  /// No description provided for @million_short.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get million_short;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @select_all.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get select_all;

  /// No description provided for @saved_articles.
  ///
  /// In en, this message translates to:
  /// **'Saved Articles'**
  String get saved_articles;

  /// No description provided for @delete_all.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get delete_all;

  /// No description provided for @read_more.
  ///
  /// In en, this message translates to:
  /// **'Read More...'**
  String get read_more;

  /// No description provided for @five_minutes_ago.
  ///
  /// In en, this message translates to:
  /// **'5 Minutes Ago'**
  String get five_minutes_ago;

  /// No description provided for @clear_notifications_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all notifications?'**
  String get clear_notifications_confirm;

  /// No description provided for @notifications_cleared_success.
  ///
  /// In en, this message translates to:
  /// **'Notifications deleted successfully'**
  String get notifications_cleared_success;

  /// No description provided for @no_results_found.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get no_results_found;

  /// No description provided for @latest.
  ///
  /// In en, this message translates to:
  /// **'Latest News'**
  String get latest;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme_mode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get theme_mode;

  /// No description provided for @choose_theme.
  ///
  /// In en, this message translates to:
  /// **'Choose App Theme'**
  String get choose_theme;

  /// No description provided for @automatic.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get automatic;

  /// No description provided for @system_default.
  ///
  /// In en, this message translates to:
  /// **'Based on Device Settings'**
  String get system_default;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @profile_info.
  ///
  /// In en, this message translates to:
  /// **'Name, Email, Profile Picture'**
  String get profile_info;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @preferences_desc.
  ///
  /// In en, this message translates to:
  /// **'Appearance, Font Size, Sources'**
  String get preferences_desc;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faq;

  /// No description provided for @app_version.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get app_version;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get no_internet_connection;

  /// No description provided for @internet_restored.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection Restored'**
  String get internet_restored;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get category;

  /// No description provided for @bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmark;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @email_already_exists.
  ///
  /// In en, this message translates to:
  /// **'Email already exists'**
  String get email_already_exists;

  /// No description provided for @failed_login_message.
  ///
  /// In en, this message translates to:
  /// **'Failed Login'**
  String get failed_login_message;

  /// No description provided for @server_error.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get server_error;
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
