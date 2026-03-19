import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/widget/app_bar_widget.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/routes_managers.dart';
import '../../../../../core/widget/arrow_back_widget.dart';

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
                AppBarWidget(title: "التحقق من الحساب",height: 140,),
                Text(
                  "أدخل رمز التحقق المكون من 6 أرقام والذي تم إرساله إلى بريدك الألكتروني",
                  style: textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                Row(
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
                SizedBox(height: 20.h),
                Center(
                  child: seconds > 0
                      ? RichText(
                          text: TextSpan(
                            text: "إعادة إرسال الرمز في ",
                            style: textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: "$seconds ث",
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
                            "إعادة إرسال الرمز",
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
            Navigator.pushNamed(context, RoutesManager.changePassword);
          },
          text: "تأكيد",
          backgroundColor: ColorsManagers.red,
          foregroundColor: ColorsManagers.white,
        ),
      ),
    );
  }
}
