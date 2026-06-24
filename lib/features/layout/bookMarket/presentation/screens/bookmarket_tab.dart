import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../provider/book_market_provider.dart';
import '../widget/book_market_header_widget.dart';

class BookMarketTab extends StatelessWidget {
  const BookMarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color shadowColor = Theme.of(context).shadowColor;

    final provider = Provider.of<BookmarkProvider>(context);
    final bookmarks = provider.bookmarks;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
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
                              appLocalizations.no_articles_yet,
                              style: textTheme.bodyMedium,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Center(
                            child: Text(
                              appLocalizations.save_favorite_articles,
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
                            text: appLocalizations.browse_news_to_save,
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
