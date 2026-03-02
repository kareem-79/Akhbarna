import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/arrow_back_widget.dart';
import '../../../../../core/widget/custom_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.h),
                Row(children: [ArrowBackWidget()]),
                SizedBox(height: 20.h),
                Image.asset(
                  ImageManagers.forgetPassword,
                  width: 210.w,
                  height: 210.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  "هل نسيت كلمة\nالسر ؟",
                  style: textTheme.bodyLarge,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 30.h),
                Text(
                  "أدخل عنوان بريدك الإلكتروني لإعادة\nتعيين كلمة المرور.",
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorsManagers.lightGray,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 10.h),
                CustomTextFormFiled(
                  label: 'البريد الالكتروني',
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 20.h),
                Text(
                  "إذا كان هذا البريد الإلكتروني مسجلاً لدينا،\n فستصلك رسالة لإعادة تعيين كلمة المرور خلال دقائق",
                  style: textTheme.bodySmall,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          top: 10.h,
        ),
        child: CustomElevatedButton(
          onPress: () {
            Navigator.pushNamed(context, RoutesManager.loginWithOtp);
          },
          text: "التالي",
          backgroundColor: ColorsManagers.red,
          foregroundColor: ColorsManagers.white,
        ),
      ),
    );
  }
}
