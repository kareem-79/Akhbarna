import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_elevated_button.dart';
import 'package:akhbarna/features/layout/bookMarket/presentation/widget/book_market_item_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:akhbarna/model/book_market_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/resources/assets_managers.dart';
import '../../../../../core/widget/section_header_widget.dart';
import '../../../home/data/models/ArticleModel.dart';
import '../cubit/save_article_cubit.dart';
import '../cubit/save_article_state.dart';
import '../widget/book_market_header_widget.dart';
import '../widget/book_market_tab_bar.dart';

class BookMarketTab extends StatefulWidget {
  const BookMarketTab({super.key});

  @override
  State<BookMarketTab> createState() => _BookMarketTabState();
}

class _BookMarketTabState extends State<BookMarketTab> {
  int selectedBookMarketTabIndex = 0;
  List<ArticleModel> filteredBookmarks = [];
  bool initialized = false;
  bool selectionMode = false;
  Set<String> selectedIds = {};

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookMarketCubit>().loadSavedArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final shadowColor = Theme.of(context).shadowColor;

    final appLocalizations = AppLocalizations.of(context)!;

    final tabs = BookMarketTabModel.tabs(context);

    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<BookMarketCubit, BookMarketState>(
              builder: (context, state) {
                if (state is BookMarketLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is BookMarketError) {
                  return Center(child: Text(state.message));
                }

                if (state is BookMarketSuccess) {
                  final bookmarks = state.articles;
                  if (tabs[selectedBookMarketTabIndex].id == "all") {
                    filteredBookmarks = List.from(bookmarks);
                  } else {
                    filteredBookmarks = bookmarks.where((article) {
                      return article.category ==
                          tabs[selectedBookMarketTabIndex].id;
                    }).toList();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BookMarketHeaderWidget(
                        hasSelection: selectedIds.isNotEmpty,
                        onDeleteAll: () async {
                          if (selectedIds.isEmpty) return;

                          for (final id in selectedIds) {
                            await context.read<BookMarketCubit>().removeArticle(
                              id,
                            );
                          }
                          setState(() {
                            selectionMode = false;
                            selectedIds.clear();
                          });
                        },
                      ),
                      if (bookmarks.isNotEmpty) ...[
                        SizedBox(height: 10.h),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: BookMarketTabBar(
                            bookMarketTabList: tabs,
                            selectedBookMarketTabIndex:
                                selectedBookMarketTabIndex,
                            onBookMarketTabSelected: (tab) {
                              setState(() {
                                selectedBookMarketTabIndex = tabs.indexOf(tab);

                                if (tab.id == "all") {
                                  filteredBookmarks = List.from(bookmarks);
                                } else {
                                  filteredBookmarks = bookmarks.where((
                                    article,
                                  ) {
                                    return article.category == tab.id;
                                  }).toList();
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SectionHeaderWidget(
                            title: appLocalizations.saved_articles,
                            actionText: appLocalizations.select_all,
                            onViewAll: () {
                              setState(() {
                                selectionMode = true;

                                if (selectedIds.length ==
                                    filteredBookmarks.length) {
                                  selectedIds.clear();
                                  selectionMode = false;
                                } else {
                                  selectedIds = filteredBookmarks
                                      .map((e) => e.id!)
                                      .toSet();
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],

                      Expanded(
                        child: bookmarks.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SvgPicture.asset(
                                        IconManagers.save,
                                        width: 100.w,
                                        height: 100.h,
                                        colorFilter: ColorFilter.mode(
                                          shadowColor,
                                          BlendMode.srcIn,
                                        ),
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
                                          appLocalizations
                                              .save_favorite_articles,
                                          style: textTheme.bodySmall?.copyWith(
                                            color: ColorsManagers.gray3,
                                          ),
                                          textAlign: TextAlign.center,
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
                                        text: appLocalizations
                                            .browse_news_to_save,
                                        foregroundColor: ColorsManagers.white,
                                        backgroundColor: ColorsManagers.red,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                itemCount: filteredBookmarks.length,
                                itemBuilder: (context, index) {
                                  return BookMarketNewsItemWidget(
                                    news: filteredBookmarks[index],
                                    selectionMode: selectionMode,
                                    isSelected: selectedIds.contains(
                                      filteredBookmarks[index].id,
                                    ),
                                    onLongSelect: () {
                                      setState(() {
                                        selectionMode = true;
                                        selectedIds.add(
                                          filteredBookmarks[index].id!,
                                        );
                                      });
                                    },
                                    onSelect: () {
                                      setState(() {
                                        if (selectedIds.contains(
                                          filteredBookmarks[index].id,
                                        )) {
                                          selectedIds.remove(
                                            filteredBookmarks[index].id,
                                          );
                                        } else {
                                          selectedIds.add(
                                            filteredBookmarks[index].id!,
                                          );
                                        }

                                        if (selectedIds.isEmpty) {
                                          selectionMode = false;
                                        }
                                      });
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
