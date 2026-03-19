import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/core/widget/custom_text_form_field.dart';
import 'package:akhbarna/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/widget/custom_text_button.dart';
import '../../../Auth_layout.dart';
import '../../../widget/custom_start_up_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AuthLayout(
      title: "مرحباً،\nسجل دخولك",
      switchText: "سجل الآن",
      onSwitch: () {
        Navigator.pushNamed(context,RoutesManager.register);
      },
      isLogin: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFiled(
              label: 'البريد الالكتروني',
              suffixIcon: Icon(Icons.email_outlined),
            ),
            CustomTextFormFiled(
              label: 'كلمة المرور',
              suffixIcon: Icon(Icons.visibility),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                onPress: () {
                  Navigator.pushNamed(context, RoutesManager.forgetPassword);
                },
                text: "نسيت كلمة المرور؟",
                color: ColorsManagers.white,
              ),
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPress: () {},
              text: "تسجيل الدخول",
              backgroundColor: ColorsManagers.red,
              foregroundColor: ColorsManagers.white,
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                "أو ادخل باستخدام",
                style: textTheme.bodySmall,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomStartUpElevatedButton(
                    onPress: () {},
                    text: "جوجل",
                    path: IconManagers.google,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomStartUpElevatedButton(
                    onPress: () {},
                    text: "فيسبوك",
                    path: IconManagers.facebook,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
