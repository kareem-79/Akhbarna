import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/widget/svg_widget.dart';
import 'package:akhbarna/features/layout/bookMarket/presentation/screens/bookmarket_tab.dart';
import 'package:akhbarna/features/layout/category/presentation/screens/category_tab.dart';
import 'package:akhbarna/features/layout/home/presentation/screens/home_tap.dart';
import 'package:akhbarna/features/layout/profile/presentation/screens/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    HomeTap(),
    CategoryTab(),
    BookMarketTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.black,
      body: tabs[selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.sp),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadiusGeometry.circular(60.r),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: _onTab,
              items: [
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconsManagers.home,
                    isSelected: selectedIndex == 0,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconsManagers.category,
                    isSelected: selectedIndex == 1,
                  ),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconsManagers.bookmark,
                    isSelected: selectedIndex == 2,
                  ),
                  label: 'Bookmark',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconsManagers.profile,
                    isSelected: selectedIndex == 3,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTab(newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
