import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:akhbarna/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/resources/constant.dart';

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
  bool _showContent = false;


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

    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeText = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 700));

    await _linesController.forward();

    setState(() {
      _showContent = true;
    });

    await _logoController.forward();

    await _textController.forward();

    await Future.delayed(const Duration(seconds: 1));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString(ChachConstant.tokenKey) ?? '';

    if (!mounted) return;

    if (token.isNotEmpty) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesManager.mainLayout,
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesManager.startUp,
        (route) => false,
      );
    }
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
          Container(color: const Color(0xff06112C)),

          AnimatedBuilder(
            animation: _linesController,
            builder: (context, child) {
              final width = MediaQuery.of(context).size.width;
              final height = MediaQuery.of(context).size.height;

              return Stack(
                children: List.generate(10, (index) {
                  final rowHeight = height / 10;

                  final moveRight = index.isEven;

                  return Positioned(
                    top: index * rowHeight,
                    child: Transform.translate(
                      offset: Offset(
                        moveRight
                            ? _linesController.value * width
                            : -_linesController.value * width,
                        0,
                      ),
                      child: Container(
                        width: width,
                        height: rowHeight,
                        color: ColorsManagers.red,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          if (_showContent)
          Center(
            child: Column(
              children: [
                const Spacer(),

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
