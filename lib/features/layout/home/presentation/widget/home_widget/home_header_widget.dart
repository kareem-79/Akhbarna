import 'package:akhbarna/core/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/resources/assets_managers.dart';
import '../../../../../../core/resources/colors_managers.dart';
import '../../../../../../core/resources/routes_managers.dart';
import '../../../../../../l10n/app_localizations.dart';

class HomeHeaderWidget extends StatefulWidget {
  final VoidCallback onTap;

  const HomeHeaderWidget({super.key, required this.onTap});

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
      height: 110.h,
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
              InkWell(
                onTap: widget.onTap,
                child: Image.asset(
                  ImageManagers.akhbarnaIcon,
                  width: 50.w,
                  height: 50.h,
                ),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: SearchWidget(
                  hintText: appLocalizations.search,
                  controller: searchController,
                ),
              ),
              SizedBox(width: 30.w),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManager.notification);
                },
                child: SvgPicture.asset(
                  IconManagers.notification,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
