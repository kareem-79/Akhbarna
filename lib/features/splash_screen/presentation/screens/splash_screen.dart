import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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

    Navigator.pushReplacementNamed(context, RoutesManager.onBoarding);
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
    return Scaffold(
      backgroundColor: ColorsManagers.darkNavy,
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
                Padding(
                  padding: EdgeInsets.only(right: 100.0.sp),
                  child: FadeTransition(
                    opacity: _fadeText,
                    child: Image.asset(
                      ImageManagers.akhbarnaText,
                      width: 140.w,
                      height: 85.h,
                    ),
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: FadeTransition(
                    opacity: _fadeText,
                    child: Text(
                      "الدنيا في خبر",
                      style: GoogleFonts.cairo(
                        color: Colors.white70,
                        fontSize: 32,
                      ),
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
