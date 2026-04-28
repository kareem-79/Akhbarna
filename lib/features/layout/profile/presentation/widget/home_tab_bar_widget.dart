import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/model/home_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_tab_items_widget.dart';

class HomeTabBar extends StatefulWidget {
  final List<HomeTabModel> homeTabList;
  int selectedHomeTabIndex;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final void Function(HomeTabModel)? onHomeTabItemSelected;

  HomeTabBar({
    super.key,
    required this.homeTabList,
    required this.selectedHomeTabIndex,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    this.onHomeTabItemSelected,
  });

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = widget.selectedHomeTabIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.homeTabList.length,
      child: Container(
        height: 60.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: ColorsManagers.red,
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: TabBar(
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          onTap: (index) {
            widget.onHomeTabItemSelected!(widget.homeTabList[index]);
            setState(() {
              selectedIndex = index;
            });
          },
          tabs: widget.homeTabList.asMap().entries.map((entry) {
            int idx = entry.key;
            var model = entry.value;
            return CustomTabItemWidget(
              homeTabModel: model,
              isSelected: selectedIndex == idx,
              selectedBgColor: ColorsManagers.gray2,
              selectedFgColor: widget.selectedFgColor,
              unSelectedBgColor: Colors.transparent,
              unSelectedFgColor: widget.unSelectedFgColor,
            );
          }).toList(),
        ),
      ),
    );
  }
}
