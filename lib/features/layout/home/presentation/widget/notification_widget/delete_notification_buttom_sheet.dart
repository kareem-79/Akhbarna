import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/resources/colors_managers.dart';
import '../../../../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../../../../l10n/app_localizations.dart';

class DeleteNotificationBottomSheet extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteNotificationBottomSheet({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      height: MediaQuery.of(context).size.height * 0.4.h,
      decoration: BoxDecoration(
        color: ColorsManagers.gray2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.r),
          topRight: Radius.circular(60.r),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Icon(
                        Icons.delete,
                        size: 120.sp,
                        color: ColorsManagers.red,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: Text(
                        "هل أنت متأكد من حذف جميع الإشعارات؟",
                        style: textTheme.bodyMedium?.copyWith(fontSize: 20.sp,color: primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPress: () {
                      onDelete();
                      Navigator.pop(context);
                      UiUtils.showToast(
                        context,
                        "تم حذف الاشعارات بنجاح",
                        ColorsManagers.lightGray,
                      );
                    },
                    text: appLocalizations.yes,
                    foregroundColor: ColorsManagers.white,
                    backgroundColor: ColorsManagers.red,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomElevatedButton(
                    onPress: () {
                      Navigator.pop(context);
                    },
                    text: appLocalizations.cancel,
                    foregroundColor: ColorsManagers.white,
                    backgroundColor: ColorsManagers.gray2,
                    borderColor: ColorsManagers.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
