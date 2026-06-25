import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/model/book_market_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMarketTabBar extends StatefulWidget {
  final List<BookMarketTabModel> bookMarketTabList;
  final int selectedBookMarketTabIndex;
  final void Function(BookMarketTabModel)? onBookMarketTabSelected;

  const BookMarketTabBar({
    super.key,
    required this.bookMarketTabList,
    required this.selectedBookMarketTabIndex,
    this.onBookMarketTabSelected,
  });

  @override
  State<BookMarketTabBar> createState() => _BookMarketTabBarState();
}

class _BookMarketTabBarState extends State<BookMarketTabBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedBookMarketTabIndex;
  }

  @override
  void didUpdateWidget(covariant BookMarketTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedBookMarketTabIndex !=
        widget.selectedBookMarketTabIndex) {
      selectedIndex = widget.selectedBookMarketTabIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      height: 48.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.bookMarketTabList.length, (index) {
            final tab = widget.bookMarketTabList[index];
            final isSelected = selectedIndex == index;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  widget.onBookMarketTabSelected?.call(tab);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
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
                      Text(tab.emoji, style: TextStyle(fontSize: 16.sp)),
                      SizedBox(width: 6.w),
                      Text(
                        tab.title,
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
    );
  }
}
