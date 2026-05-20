import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/features/auth/widget/auth_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../provider/config_provider.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({
    super.key,
    required this.child,
    required this.title,
    required this.switchText,
    required this.onSwitch,
    required this.isLogin,
  });

  final Widget child;
  final String title;
  final String switchText;
  final VoidCallback onSwitch;
  final bool isLogin;

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<ConfigProvider>(
                    builder: (context, provider, child) {
                      return SvgPicture.asset(
                        provider.currentTheme == ThemeMode.dark
                            ? ImageManagers.akhbarnaText
                            : ImageManagers.akhbarnaTextLightMood,
                        height: 50.h,
                      );
                    },
                  ),
                  Image.asset(
                    ImageManagers.akhbarnaIcon,
                    width: 60.w,
                    height: 60.h,
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              AuthSwitch(
                isLogin: widget.isLogin,
                onSwitch: widget.onSwitch,
                textTheme: textTheme,
              ),
              SizedBox(height: 32.h),
              Text(widget.title, style: textTheme.bodyLarge),
              SizedBox(height: 24.h),
              Expanded(child: widget.child),
            ],
          ),
        ),
      ),
    );
  }
}
