import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../Auth_layout.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AuthLayout(
      title: "سجل حساب\nجديد",
      switchText: "تسجيل الدخول",
      onSwitch: () {
        Navigator.pushNamed(context,RoutesManager.login);
      },
      isLogin: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFiled(
              label: 'الاسم',
              suffixIcon: Icon(Icons.person_2_outlined),
            ),
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
              child: Text("الحد الأدنى: حرف كبير واحد، رقم واحد، رمز واحد، 8 أحرف",style:textTheme.bodySmall?.copyWith(fontSize: 11.sp),)
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPress: () {},
              text: "تسجيل الدخول",
              backgroundColor: ColorsManagers.red,
              foregroundColor: ColorsManagers.white,
            ),
          ],
        ),
      ),
    );
  }
}
