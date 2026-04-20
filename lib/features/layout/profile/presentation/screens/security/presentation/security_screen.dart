import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/security/widget/security_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/routes_managers.dart';
import '../../../../../../../core/widget/custom_buttom_navigation_bar.dart';
import '../../../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../../../l10n/app_localizations.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SecurityHeaderWidget(),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      appLocalizations.change_password,
                      style: textTheme.bodyLarge?.copyWith(
                        color: ColorsManagers.red,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      appLocalizations.password_rule2,
                      style: textTheme.bodySmall,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormFiled(
                      label: appLocalizations.email,
                      suffixIcon: Icon(Icons.email_outlined),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormFiled(
                      label: appLocalizations.password,
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        appLocalizations.password_rule,
                        style: textTheme.bodySmall?.copyWith(fontSize: 11.sp),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormFiled(
                      label: appLocalizations.confirm_new_password,
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        appLocalizations.password_rule,
                        style: textTheme.bodySmall?.copyWith(fontSize: 11.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
        onPress: () {
          Navigator.pushNamed(context, RoutesManager.profile);
          UiUtils.showToast(context, appLocalizations.password_changed, ColorsManagers.riverBed);
        },
        text: appLocalizations.change_password,
        backgroundColor: ColorsManagers.red,
        foregroundColor: ColorsManagers.white,
      ),
    );
  }
}
