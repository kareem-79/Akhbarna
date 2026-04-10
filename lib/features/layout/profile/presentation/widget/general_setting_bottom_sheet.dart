import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/setting_row_widget.dart';
import 'package:akhbarna/features/layout/profile/presentation/widget/text_size_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/config_provider.dart';

class GeneralSettingsBottomSheet extends StatelessWidget {
  const GeneralSettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<ConfigProvider>(
      builder: (context, config, child) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75.h,
            decoration: BoxDecoration(
              color: ColorsManagers.gray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.r),
                topRight: Radius.circular(60.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Column(
                children: [
                  Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  Text("الإعدادات العامة", style: textTheme.bodyMedium),
                  SizedBox(height: 24.h),

                  SettingRowWidget(
                    title: "الوضع الفاتح",
                    value: config.currentTheme == ThemeMode.light,
                    onChanged: (bool isLight) {
                      config.changeAppTheme(
                        isLight ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                    icon: Icons.light_mode,
                  ),
                  SizedBox(height: 16.h),
                  SettingRowWidget(
                    title: "تلقائي (حسب إعدادات الجهاز)",
                    value: config.isSystemFont,
                    onChanged: (val) {
                      config.changeFontSize(val ? "تلقائي" : "متوسط");
                    },
                    icon: Icons.text_fields,
                  ),
                  Divider(color: Colors.grey[800], height: 40.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Image.asset(IconManagers.fontStyle),
                        Text(
                          "حجم الخط",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextSizeOptionWidget(size: "صغير"),
                  TextSizeOptionWidget(size: "متوسط"),
                  TextSizeOptionWidget(size: "كبير"),
                  TextSizeOptionWidget(size: "كبير جدا"),
                  const Spacer(),
                  CustomElevatedButton(
                    onPress: () {},
                    text: "تعديل المصادر",
                    foregroundColor: ColorsManagers.white,
                    backgroundColor: ColorsManagers.red,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
