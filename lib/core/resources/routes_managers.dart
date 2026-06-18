import 'package:akhbarna/features/auth/forget_password/presentation/screens/change_password.dart';
import 'package:akhbarna/features/auth/forget_password/presentation/screens/forget_password.dart';
import 'package:akhbarna/features/auth/forget_password/presentation/screens/login_with_OTP.dart';
import 'package:akhbarna/features/auth/login/presentation/screens/login_screen.dart';
import 'package:akhbarna/features/auth/register/presentation/screens/register_screen.dart';
import 'package:akhbarna/features/auth/start_up/presentation/screens/start_up_screen.dart';
import 'package:akhbarna/features/layout/home/presentation/screens/most_read_Screen.dart';
import 'package:akhbarna/features/layout/home/presentation/screens/notification_screen.dart';
import 'package:akhbarna/features/layout/home/presentation/screens/top_news_screen.dart';
import 'package:akhbarna/features/layout/main_layout.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/about/presentation/about_screen.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/profile_tab.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/security/presentation/security_screen.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/ِaccount_information/presentation/edit_profile_screen.dart';
import 'package:akhbarna/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:akhbarna/features/setup/category_select/presentation/screens/select_category.dart';
import 'package:akhbarna/features/setup/language_select/presentation/screens/select_language.dart';
import 'package:akhbarna/features/setup/locations_select/presentation/screens/select_location.dart';
import 'package:akhbarna/features/setup/sources_select/presentation/screens/select_sources.dart';
import 'package:akhbarna/features/setup/start/presentation/screens/start_screen.dart';
import 'package:akhbarna/features/splash_screen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/layout/category/presentation/screens/category_article_screen.dart';
import '../../features/layout/profile/presentation/screens/general_settings/presentation/general_setting.dart';

class RoutesManager {
  static const String splash = "Splash";
  static const String startUp = "/startUp";
  static const String register = "/register";
  static const String login = "/Login";
  static const String onBoarding = "OnBoarding";
  static const String forgetPassword = "ForgetPassword";
  static const String loginWithOtp = "LoginWithOtp";
  static const String changePassword = "ChangePassword";
  static const String selectLocation = "SelectLocation";
  static const String selectCategory = "SelectCategory";
  static const String selectLanguage = "SelectLanguage";
  static const String selectSources = "SelectSources";
  static const String start = "Start";
  static const String mainLayout = "MainLayout";
  static const String profile = "ProfileTab";
  static const String editProfile = "EditProfile";
  static const String security = "Security";
  static const String aboutUs = "AboutUs";
  static const String notification = "Notification";
  static const String topNews = "TopNews";
  static const String mostRead = "MostRead";
  static const String categoryArticle = "CategoryArticle";
  static const String generalSettings = "GeneralSettings";

  static Route<dynamic> slideRight(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: const Duration(milliseconds: 420),
      reverseTransitionDuration: const Duration(milliseconds: 320),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
              Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
              ),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return slideRight(const SplashScreen());

      case onBoarding:
        return slideRight(const OnBoardingScreen());

      case startUp:
        return slideRight(const StartUpScreen());

      case register:
        return slideRight(const RegisterScreen());

      case login:
        return slideRight(const LoginScreen());

      case forgetPassword:
        return slideRight(const ForgetPassword());

      case loginWithOtp:
        return slideRight(const LoginWithOtp());

      case changePassword:
        return slideRight(const ChangePassword());

      case selectLocation:
        return slideRight(const SelectLocation());

      case selectCategory:
        return slideRight(const SelectCategory());

      case selectLanguage:
        final bool isFromEdit = settings.arguments as bool? ?? false;
        return slideRight(SelectLanguage(isFromEdit: isFromEdit));

      case selectSources:
        final bool isFromEdit = settings.arguments as bool? ?? false;
        return slideRight(SelectSources(isFromEdit: isFromEdit));

      case start:
        return slideRight(const StartScreen());

      case mainLayout:
        return slideRight(const MainLayout());

      case profile:
        return slideRight(const ProfileTab());

      case editProfile:
        return slideRight(const EditProfile());

      case security:
        return slideRight(const SecurityScreen());

      case aboutUs:
        return slideRight(const AboutUsScreen());

      case notification:
        return slideRight(const NotificationScreen());

      case topNews:
        return slideRight(const TopNewsScreen());

      case mostRead:
        return slideRight(const MostReadScreen());
      case categoryArticle:
        final String categoryName = settings.arguments as String;
        return slideRight(CategoryArticleScreen(categoryName: categoryName));
      case generalSettings:
        return slideRight(const GeneralSettingsScreen());
      default:
        return slideRight(
          const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
