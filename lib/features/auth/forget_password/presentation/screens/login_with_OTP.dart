import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/utils/ui_utils.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../l10n/app_localizations.dart';
import '../cubit/forget_password_cubit.dart';
import '../cubit/state/forget_password_state.dart';

class LoginWithOtp extends StatefulWidget {
  const LoginWithOtp({super.key});

  @override
  State<LoginWithOtp> createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  String get otp => controllers.map((e) => e.text).join();
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  late String email;
  int seconds = 90;
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      if (seconds > 0) {
        setState(() {
          seconds--;
        });

        _startTimer();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    email = ModalRoute.of(context)?.settings.arguments as String? ?? "";
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is VerifyOtpLoading) {
          UiUtils.showLoadingDialog(context, isDisable: false);
        } else if (state is VerifyOtpError) {
          UiUtils.hideDialog(context);

          UiUtils.showToast(context, state.message, ColorsManagers.red);
        } else if (state is VerifyOtpSuccess) {
          UiUtils.hideDialog(context);

          Navigator.pushReplacementNamed(
            context,
            RoutesManager.changePassword,
            arguments: {"email": email, "otp": otp},
          );
        } else if (state is ForgetPasswordSuccess) {
          UiUtils.hideDialog(context);
          UiUtils.showToast(context, state.message, Colors.green);
        } else if (state is ForgetPasswordError) {
          UiUtils.hideDialog(context);
          UiUtils.hideDialog(context);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            UiUtils.showToast(context, state.message, ColorsManagers.red);
          });
        } else if (state is ResendOtpLoading) {
          UiUtils.showLoadingDialog(context);
        } else if (state is ResendOtpSuccess) {
          UiUtils.hideDialog(context);

          UiUtils.showToast(context, state.message, Colors.green);
        } else if (state is ResendOtpError) {
          UiUtils.hideDialog(context);

          UiUtils.showToast(context, state.message, ColorsManagers.red);
        }
      },
      child: Scaffold(
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
                              context.read<ForgetPasswordCubit>().resendOtp(
                                email,
                              );

                              setState(() {
                                seconds = 90;
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
              if (otp.length != 6) {
                setState(() {
                  showError = true;
                });
                return;
              }

              context.read<ForgetPasswordCubit>().verifyOtp(
                email: email,
                otp: otp,
              );
            },

            text: appLocalizations.confirm,
            backgroundColor: ColorsManagers.red,
            foregroundColor: ColorsManagers.white,
          ),
        ),
      ),
    );
  }
}
