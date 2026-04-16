import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import '../../../../../l10n/app_localizations.dart';
import '../widget/term_item_widget.dart';

class TermsBottomSheet extends StatelessWidget {
  const TermsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: ColorsManagers.gray2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.r),
              topRight: Radius.circular(60.r),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                appLocalizations.terms_and_conditions,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: ColorsManagers.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  children: [
                    TermsItemWidget(
                      index: 1,
                      title: appLocalizations.terms_1_title,
                      description: appLocalizations.terms_1_desc,
                    ),
                    TermsItemWidget(
                      index: 2,
                      title: appLocalizations.terms_2_title,
                      description: appLocalizations.terms_2_desc,
                    ),
                    TermsItemWidget(
                      index: 3,
                      title: appLocalizations.terms_3_title,
                      description: appLocalizations.terms_3_desc,
                    ),
                    TermsItemWidget(
                      index: 4,
                      title: appLocalizations.terms_4_title,
                      description: appLocalizations.terms_4_desc,
                    ),
                    TermsItemWidget(
                      index: 5,
                      title: appLocalizations.terms_5_title,
                      description: appLocalizations.terms_5_desc,
                    ),
                    TermsItemWidget(
                      index: 6,
                      title: appLocalizations.terms_6_title,
                      description: appLocalizations.terms_6_desc,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: CustomElevatedButton(
                    text: "${appLocalizations.agree_to}${appLocalizations.terms_and_conditions}",
                    backgroundColor: ColorsManagers.red,
                    foregroundColor: ColorsManagers.white,
                    onPress: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}