import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    child: Image.asset(
                      ImageManagers.akhbarnaText,
                      width: 200.w,
                      height: 80.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Center(
                    child: Column(
                      children: [
                        Text("حسابك جاهز،", style: textTheme.bodyMedium),
                        Text("يلا نبدأ!", style: textTheme.bodyMedium),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h,),
                  Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val!;
                          });
                        },
                        activeColor: ColorsManagers.red,
                      ),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: "أوافق على ",
                            style: textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: "الشروط والأحكام",
                                style: textTheme.bodySmall?.copyWith(
                                  color: ColorsManagers.red,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: " وبيان الخصوصية والأسعار"),
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
                Text("اكتشف الأخبار"),
                SizedBox(width: 8.w),
                Image.asset(IconManagers.arrowRight,width: 30.w, height: 30.h, fit: BoxFit.contain)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
