import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/widget/custom_text_button.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../auth_layout.dart';
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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AuthLayout(
      title: appLocalizations.welcome_back,
      switchText: appLocalizations.register_now,
      onSwitch: () {
        Navigator.pushNamed(context, RoutesManager.register);
      },
      isLogin: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFiled(
              label: appLocalizations.email,
              suffixIcon: Icon(Icons.email_outlined),
            ),
            CustomTextFormFiled(
              label: appLocalizations.password,
              suffixIcon: Icon(Icons.visibility),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                onPress: () {
                  Navigator.pushNamed(context, RoutesManager.forgetPassword);
                },
                text: appLocalizations.forgot_password,
                color: ColorsManagers.white,
              ),
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPress: () {
                Navigator.pushNamed(context, RoutesManager.selectLocation);
              },
              text: appLocalizations.login,
              backgroundColor: ColorsManagers.red,
              foregroundColor: ColorsManagers.white,
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                appLocalizations.or_login_with,
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
