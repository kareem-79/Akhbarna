import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../provider/book_market_provider.dart';
import '../../../home/presentation/widget/breaking_widget/breaking_news_item_widget.dart';
import '../widget/book_market_header_widget.dart';

class BookMarketTab extends StatelessWidget {
  const BookMarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color shadowColor = Theme.of(context).shadowColor;

    final provider = Provider.of<BookmarkProvider>(context);
    final bookmarks = provider.bookmarks;

    return Scaffold(
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BookMarketHeaderWidget(),
          SizedBox(height: 10.h),
          Expanded(
            child: bookmarks.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SvgPicture.asset(
                            IconManagers.save,
                            width: 100.w,
                            height: 100.h,
                            color: shadowColor,
                          ),
                          SizedBox(height: 8.h),
                          Center(
                            child: Text(
                              "لا يوجد مقالات بعد",
                              style: textTheme.bodyMedium,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Center(
                            child: Text(
                              "احفظ مقالاتك المفضلة وكن \nأول من يقرأها في أي وقت",
                              style: textTheme.bodySmall?.copyWith(
                                color: ColorsManagers.gray3,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CustomElevatedButton(
                            onPress: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.topNews,
                              );
                            },
                            text: "استعرض الأخبار للحفظ",
                            foregroundColor: ColorsManagers.white,
                            backgroundColor: ColorsManagers.red,
                          ),
                        ],
                      ),
                    ),
                  )
                : CustomScrollView(
                    slivers: [

                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
