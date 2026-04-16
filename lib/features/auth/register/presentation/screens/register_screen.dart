import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../auth_layout.dart';
import '../../../widget/custom_start_up_elevated_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AuthLayout(
      title: appLocalizations.signup,
      switchText: appLocalizations.login,
      onSwitch: () {
        Navigator.pushNamed(context, RoutesManager.login);
      },
      isLogin: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFiled(
              label: appLocalizations.name,
              suffixIcon: Icon(Icons.person_2_outlined),
            ),
            CustomTextFormFiled(
              label: appLocalizations.email,
              suffixIcon: Icon(Icons.email_outlined),
            ),
            CustomTextFormFiled(
              label: appLocalizations.password,
              suffixIcon: Icon(Icons.visibility),
            ),
            Align(
              child: Text(
                appLocalizations.password_rule,
                style: textTheme.bodySmall?.copyWith(fontSize: 11.sp),
              ),
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPress: () {
                Navigator.pushNamed(context, RoutesManager.login);
              },
              text: appLocalizations.create_account,
              backgroundColor: ColorsManagers.red,
              foregroundColor: ColorsManagers.white,
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Text(appLocalizations.or_login_with, style: textTheme.bodySmall),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomStartUpElevatedButton(
                    onPress: () {},
                    text: appLocalizations.google,
                    path: IconManagers.google,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomStartUpElevatedButton(
                    onPress: () {},
                    text: appLocalizations.facebook,
                    path: IconManagers.facebook,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
