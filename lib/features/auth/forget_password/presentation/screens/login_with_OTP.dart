import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../l10n/app_localizations.dart';

class LoginWithOtp extends StatefulWidget {
  const LoginWithOtp({super.key});

  @override
  State<LoginWithOtp> createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  int seconds = 60;
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (seconds > 0) {
        setState(() => seconds--);
        _startTimer();
      }
    });
  }

  bool _isOtpComplete() {
    return controllers.every((c) => c.text.trim().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(
                  title: appLocalizations.verify_account,
                  height: 140,
                ),

                Text(
                  appLocalizations.enter_code,
                  style: textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 40.h),

                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: TextFormField(
                          cursorColor: ColorsManagers.blue,
                          controller: controllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: textTheme.bodyMedium,
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                color: ColorsManagers.lightGray,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                color: ColorsManagers.blue,
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              showError = false;
                            });

                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ),
                if (showError)
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      appLocalizations.otp_required,
                      style: textTheme.bodySmall?.copyWith(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),

                SizedBox(height: 20.h),

                Center(
                  child: seconds > 0
                      ? RichText(
                          text: TextSpan(
                            text: appLocalizations.resend_code_in,
                            style: textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: " $seconds ${appLocalizations.seconds}",
                                style: textTheme.bodySmall?.copyWith(
                                  color: ColorsManagers.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            setState(() {
                              seconds = 60;
                            });
                            _startTimer();
                          },
                          child: Text(
                            appLocalizations.resend_code,
                            style: textTheme.bodySmall?.copyWith(
                              color: ColorsManagers.red,
                            ),
                          ),
                        ),
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
            if (!_isOtpComplete()) {
              setState(() {
                showError = true;
              });
              return;
            }
            Navigator.pushNamed(context, RoutesManager.changePassword);
          },
          text: appLocalizations.confirm,
          backgroundColor: ColorsManagers.red,
          foregroundColor: ColorsManagers.white,
        ),
      ),
    );
  }
}
