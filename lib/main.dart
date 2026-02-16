import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/Theme/theme_manager.dart';
import 'features/layout/main_layout.dart';

void main() {
  runApp(const Akhbarna());
}

class Akhbarna extends StatelessWidget {
  const Akhbarna({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(393, 852),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.dark,
        home: MainLayout(),
      ),
    );
  }
}
