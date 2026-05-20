import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_text_button.dart';
import 'package:akhbarna/features/auth/widget/custom_start_up_elevated_button.dart';
import 'package:akhbarna/firebase/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/prefs_manager/prefs_manager.dart';
import '../../../../../l10n/app_localizations.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              Stack(
                children: [
                  Image.asset(
                    ImageManagers.startUpNews,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    bottom: 50.h,
                    left: 10.w,
                    right: 10.w,
                    child: Text(
                      appLocalizations.option,
                      style: textTheme.bodyMedium?.copyWith(
                        color: primaryColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Positioned(
                    bottom: 20.h,
                    left: 10.w,
                    right: 10.w,
                    child: Wrap(
                      children: [
                        Text(
                          appLocalizations.register,
                          style: textTheme.bodyMedium?.copyWith(
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          appLocalizations.login_simple,
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
                onPress: () {
                  Navigator.pushNamed(context, RoutesManager.login);
                },
                text: appLocalizations.login_with_email,
                foregroundColor: ColorsManagers.white,
                backgroundColor: ColorsManagers.red,
                path: IconManagers.email,
              ),

              CustomStartUpElevatedButton(
                onPress: () async {
                  final response =
                  await FirebaseServices.signInWithGoogle(context);

                  if (response != null) {
                    _navigate();
                  }
                },
                text: appLocalizations.login_with_google,
                path: IconManagers.google,
              ),

              CustomStartUpElevatedButton(
                onPress: () {},
                text: appLocalizations.login_with_facebook,
                path: IconManagers.facebook,
              ),

              SizedBox(height: 20.h),

              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      appLocalizations.no_account,
                      style: textTheme.bodySmall,
                    ),

                    SizedBox(width: 8.w),

                    CustomTextButton(
                      onPress: () {
                        Navigator.pushNamed(context, RoutesManager.register);
                      },
                      text: appLocalizations.create_account,
                      color: ColorsManagers.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigate() async {
    bool hasEnteredBefore = await PrefsManager.checkEntering();
    if (!hasEnteredBefore) {
      await PrefsManager.saveEntering();
      Navigator.pushReplacementNamed(context, RoutesManager.onBoarding);
    } else {
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    }
  }
}
