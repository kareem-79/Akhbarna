import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageManagers.akhbarnaIcon,
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: CustomTextFormFiled(
                  label: appLocalizations.search,
                  suffixIcon: Icon(Icons.search_outlined),
                  controller: searchController,
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(width: 30.w),
              SvgPicture.asset(
                IconManagers.notification,
                width: 30.w,
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
