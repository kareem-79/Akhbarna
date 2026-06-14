import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../model/home_tab_model.dart';

class HomeTabBar extends StatefulWidget {
  final List<HomeTabModel> homeTabList;
  final int selectedHomeTabIndex;
  final void Function(HomeTabModel)? onHomeTabItemSelected;

  const HomeTabBar({
    super.key,
    required this.homeTabList,
    required this.selectedHomeTabIndex,
    this.onHomeTabItemSelected,
  });

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedHomeTabIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color primaryColor = Theme.of(context).primaryColor;
    return SizedBox(
      height: 48.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
          child: Row(
            children: List.generate(widget.homeTabList.length, (index) {
              final tab = widget.homeTabList[index];
              final isSelected = selectedIndex == index;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });

                    widget.onHomeTabItemSelected?.call(tab);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? ColorsManagers.red
                          : ColorsManagers.dark,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(tab.emoji, style: TextStyle(fontSize: 10.sp)),
                        SizedBox(width: 6.w),
                        Text(
                          tab.name,
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 14.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
