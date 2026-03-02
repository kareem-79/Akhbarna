import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/core/widget/custom_text_button.dart';
import 'package:akhbarna/features/auth/widget/custom_start_up_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    ImageManagers.startUpNews,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 50.h,
                    right: 20.w,
                    child: Text("خيار", style: textTheme.bodyMedium),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(" تسجيل", style: textTheme.bodyMedium),
                        Text(
                          "الدخول",
                          style: textTheme.bodyMedium?.copyWith(
                            color: ColorsManagers.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomStartUpElevatedButton(
                onPress: () {},
                text: "متابعة مع البريد الإلكتروني",
                foregroundColor: ColorsManagers.white,
                backgroundColor: ColorsManagers.red,
                path: IconsManagers.email,
              ),
              CustomStartUpElevatedButton(
                onPress: () {},
                text: "Google تسجيل باستخدام ",
                path: IconsManagers.google,
              ),
              CustomStartUpElevatedButton(
                onPress: () {},
                text: "Facebook تسجيل باستخدام ",
                path: IconsManagers.facebook,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text("ليس لديك حساب؟", style: textTheme.bodySmall),
                  SizedBox(width: 8.w),
                  CustomTextButton(
                    onPress: () {
                      Navigator.pushNamed(context, RoutesManager.register);
                    },
                    text: "إنشاء حساب",
                    color: ColorsManagers.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
