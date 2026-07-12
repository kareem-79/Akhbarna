import 'dart:async';
import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/widget/svg_widget.dart';
import 'package:akhbarna/features/layout/bookMarket/presentation/screens/bookmarket_tab.dart';
import 'package:akhbarna/features/layout/category/presentation/screens/category_tab.dart';
import 'package:akhbarna/features/layout/home/presentation/screens/home_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../core/resources/routes_managers.dart';
import '../../core/utils/ui_utils.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  DateTime? _lastBackPressed;
  late final PageController _pageController;
  late StreamSubscription<InternetStatus> internetSubscription;

  bool isDisconnected = false;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    Future.microtask(() async {
      final hasInternet = await InternetConnection().hasInternetAccess;

      if (!hasInternet && mounted) {
        isDisconnected = true;
        UiUtils.showToast(context, 'لا يوجد اتصال بالإنترنت', Colors.red);
      }
    });
    internetSubscription = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      switch (status) {
        case InternetStatus.connected:
          if (isDisconnected) {
            isDisconnected = false;
            UiUtils.showToast(
              context,
              'تم استعادة الاتصال بالإنترنت',
              Colors.green,
            );
          }
          break;

        case InternetStatus.disconnected:
          if (!isDisconnected) {
            isDisconnected = true;

            UiUtils.showToast(context, 'لا يوجد اتصال بالإنترنت', Colors.red);
          }
          break;
      }
    });
  }

  @override
  void dispose() {
    internetSubscription.cancel();
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> tabs = [
    const HomeTap(),
    const CategoryTab(),
    const BookMarketTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (selectedIndex != 0) {
          _onTab(0);
          return;
        }

        final now = DateTime.now();

        if (_lastBackPressed == null ||
            now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
          _lastBackPressed = now;

          UiUtils.showToast(context, 'اضغط مرة أخرى للخروج', ColorsManagers.riverBed);

          return;
        }
        SystemNavigator.pop();
      },
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: tabs,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.sp),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60.r),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: selectedIndex,
              onTap: _onTab,
              items: [
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.home,
                    isSelected: selectedIndex == 0,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.category,
                    isSelected: selectedIndex == 1,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.bookmark,
                    isSelected: selectedIndex == 2,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgWidget(
                    image: IconManagers.profile,
                    isSelected: selectedIndex == 3,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTab(int newIndex) {
    if (newIndex == 3) {
      Navigator.pushNamed(context, RoutesManager.profile);
      return;
    }

    setState(() {
      selectedIndex = newIndex;
    });

    _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
