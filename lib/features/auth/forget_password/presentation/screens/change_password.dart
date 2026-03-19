import 'package:akhbarna/core/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/arrow_back_widget.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(title: "", height: 20),
                Image.asset(
                  ImageManagers.changePassword,
                  width: 210.w,
                  height: 210.h,
                ),
                Text(
                  "تغيير كلمة السر",
                  style: textTheme.bodyLarge,
                ),
                SizedBox(height: 20.h),
                CustomTextFormFiled(
                  label: 'البريد الالكتروني',
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 10.h),
                CustomTextFormFiled(
                  label: 'كلمة المرور',
                  suffixIcon: Icon(Icons.visibility),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text("الحد الأدنى: حرف كبير واحد، رقم واحد، رمز واحد، 8 أحرف",style:textTheme.bodySmall?.copyWith(fontSize: 11.sp),)
                ),
                SizedBox(height: 10.h),
                CustomTextFormFiled(
                  label: 'تاكيد كلمة المرور',
                  suffixIcon: Icon(Icons.visibility),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text("الحد الأدنى: حرف كبير واحد، رقم واحد، رمز واحد، 8 أحرف",style:textTheme.bodySmall?.copyWith(fontSize: 11.sp),)
                ),
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
            Navigator.pushNamedAndRemoveUntil(context, RoutesManager.mainLayout,(route) => false);
          },
          text: "تأكيد",
          backgroundColor: ColorsManagers.red,
          foregroundColor: ColorsManagers.white,
        ),
      ),
    );
  }
}
