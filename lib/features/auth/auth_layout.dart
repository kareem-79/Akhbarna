import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/features/auth/widget/auth_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widget/arrow_back_widget.dart';

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
                  ArrowBackWidget(),
                  Image.asset(
                    ImageManagers.akhbarnaText,
                    width: 100.w,
                    height: 50.h,
                  ),
                  Image.asset(
                    ImageManagers.akhbarnaIcon,
                    width: 70.w,
                    height: 70.h,
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
              Text(
                widget.title,
                style: textTheme.bodyLarge,
              ),
              SizedBox(height: 24.h),
              Expanded(child: widget.child),
            ],
          ),
        ),
      ),
    );
  }
}
