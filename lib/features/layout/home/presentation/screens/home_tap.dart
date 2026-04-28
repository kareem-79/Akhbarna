import 'package:akhbarna/features/layout/home/presentation/widget/home_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../model/home_tab_model.dart';
import '../../../profile/presentation/widget/home_tab_bar_widget.dart';
import '../../../profile/presentation/widget/top_news_widget.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late HomeTabModel selectedHomeTab = HomeTabModel.homeTabList(context)[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeHeaderWidget(),
          Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopNewsWidget(),
                  SizedBox(height: 10.h),
                  HomeTabBar(
                    homeTabList: HomeTabModel.homeTabList(context),
                    selectedHomeTabIndex: 0,
                    selectedBgColor: ColorsManagers.gray2,
                    selectedFgColor: ColorsManagers.white,
                    unSelectedBgColor: ColorsManagers.red,
                    unSelectedFgColor: ColorsManagers.white,
                    onHomeTabItemSelected: (homeTabModel) {
                      setState(() {
                        selectedHomeTab = homeTabModel;
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
