import 'dart:ui';

import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/widget/svg_widget.dart';
import 'package:akhbarna/features/layout/bookMarket/presentation/screens/bookmarket_tab.dart';
import 'package:akhbarna/features/layout/category/presentation/screens/category_tab.dart';
import 'package:akhbarna/features/layout/home/presentation/screens/home_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/routes_managers.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    const HomeTap(),
    const CategoryTab(),
    const BookMarketTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60.r),
          child: BottomNavigationBar(
              elevation: 0,
              currentIndex: selectedIndex,
              onTap: _onTab,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.home,
                    isSelected: selectedIndex == 0,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.category,
                    isSelected: selectedIndex == 1,
                  ),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.bookmark,
                    isSelected: selectedIndex == 2,
                  ),
                  label: 'Bookmark',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.profile,
                    isSelected: selectedIndex == 3,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
  }
  void _onTab(int newIndex) {
    if (newIndex == 3) {
      Navigator.pushNamed(context, RoutesManager.profile);
    } else {
      setState(() {
        selectedIndex = newIndex;
      });
    }
  }
}