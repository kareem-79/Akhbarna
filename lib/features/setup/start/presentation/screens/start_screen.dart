import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/app_bar_widget.dart';
import 'package:akhbarna/features/setup/start/presentation/screens/terms_screen.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/config_provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 500.h,
                decoration: BoxDecoration(
                  color: ColorsManagers.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(300.r, 300.r),
                    bottomRight: Radius.elliptical(300.r, 300.r),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(title: "", height: 35.h),
                  SizedBox(height: 80.h),
                  Center(
                    child: Consumer<ConfigProvider>(
                      builder: (context, provider, child) {
                        return SvgPicture.asset(
                          provider.currentTheme == ThemeMode.dark
                              ? ImageManagers.akhbarnaText
                              : ImageManagers.akhbarnaTextLightMood,
                          height: 80.h,
                          width: 200.w,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          appLocalizations.account_ready,
                          style: textTheme.bodyMedium,
                        ),
                        Text(
                          appLocalizations.lets_start,
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Row(
                    children: [
                      Checkbox(
                        shape: const CircleBorder(),
                        value: isChecked,
                        onChanged: (val) async {
                          if (isChecked) {
                            setState(() {
                              isChecked = false;
                            });
                            return;
                          }
                          final result = await showTermsBottomSheet(context);
                          if (result == true) {
                            setState(() {
                              isChecked = true;
                            });
                          }
                        },
                        activeColor: ColorsManagers.red,
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: appLocalizations.agree_to,
                            style: textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: appLocalizations.terms_and_conditions,
                                style: textTheme.bodySmall?.copyWith(
                                  color: ColorsManagers.red,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showTermsBottomSheet(context);
                                  },
                              ),
                              TextSpan(
                                text:
                                    appLocalizations.privacy_policy_and_pricing,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          top: 10.h,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isChecked
                  ? ColorsManagers.red
                  : ColorsManagers.gray,
              foregroundColor: ColorsManagers.white,
            ),
            onPressed: () {
              if (isChecked) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesManager.mainLayout,
                  (route) => false,
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appLocalizations.discover_news),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  IconManagers.arrowRight,
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> showTermsBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const TermsBottomSheet();
      },
    );
  }
}
