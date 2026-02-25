import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/features/auth/widget/auth_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({
    super.key,
    required this.child,
    required this.title,
    required this.switchText,
    required this.onSwitch, required this.isLogin,
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
                  Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: ColorsManagers.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Image.asset(
                    AssetsManagers.akhbarna_text,
                    width: 100.w,
                    height: 50.h,
                  ),
                  Image.asset(
                    AssetsManagers.akhbarna_icon,
                    width: 70.w,
                    height: 70.h,
                  ),
                ],
              ),
              SizedBox(height: 35.h,),
              AuthSwitch(
                isLogin: widget.isLogin,
                onSwitch: widget.onSwitch,
                textTheme: textTheme,
              ),

              SizedBox(height: 32.h),
              Text(
                widget.title,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
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
