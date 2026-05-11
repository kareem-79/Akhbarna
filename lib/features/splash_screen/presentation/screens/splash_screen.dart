import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:akhbarna/provider/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/prefs_manager/prefs_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _linesController;
  late AnimationController _logoController;
  late AnimationController _textController;

  late Animation<double> _logoScale;
  late Animation<double> _fadeText;

  @override
  void initState() {
    super.initState();

    _linesController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _logoScale = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeText = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await _linesController.forward();
    await _logoController.forward();
    await _textController.forward();

    await Future.delayed(const Duration(seconds: 1));
    FirebaseAuth.instance.currentUser == null
        ? Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesManager.startUp,
            (route) => false,
          )
        : Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesManager.mainLayout,
            (route) => false,
          );
  }

  @override
  void dispose() {
    _linesController.dispose();
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                ScaleTransition(
                  scale: _logoScale,
                  child: Image.asset(
                    ImageManagers.akhbarnaIcon,
                    width: 150.w,
                    height: 160.h,
                  ),
                ),
                FadeTransition(
                  opacity: _fadeText,
                  child: Consumer<ConfigProvider>(
                    builder: (context, provider, child) {
                      return SvgPicture.asset(
                        provider.currentTheme == ThemeMode.dark
                            ? ImageManagers.akhbarnaText
                            : ImageManagers.akhbarnaTextLightMood,
                        height: 85.h,
                        width: 140.w,
                      );
                    },
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: FadeTransition(
                    opacity: _fadeText,
                    child: Text(
                      appLocalizations.welcome_title,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
