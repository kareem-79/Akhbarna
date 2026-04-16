import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/app_bar_widget.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(title: "",height: 40,),
                Image.asset(
                  ImageManagers.forgetPassword,
                  width: 210.w,
                  height: 210.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  appLocalizations.forgot_password,
                  style: textTheme.bodyLarge,
                ),
                SizedBox(height: 30.h),
                Text(
                  appLocalizations.reset_password_instruction,
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorsManagers.lightGray,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextFormFiled(
                  label: appLocalizations.email,
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 20.h),
                Text(
                  appLocalizations.reset_password_note,
                  style: textTheme.bodySmall,
                  textAlign: TextAlign.center,
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
          text: appLocalizations.next,
          backgroundColor: ColorsManagers.red,
          foregroundColor: ColorsManagers.white,
        ),
      ),
    );
  }
}
