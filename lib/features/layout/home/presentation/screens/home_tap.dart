import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/breaking_news_cubit.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/state/breaking_news_state.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/breaking_widget/breaking_news_item_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/breaking_widget/breaking_news_loading_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/home_widget/home_header_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/most_read_widget/most_read_news_item_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/top_news_widget/top_news_item_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/weather_widget/weather_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/services/location_service.dart';
import '../../../../../core/widget/section_header_widget.dart';
import '../../../../../model/home_tab_model.dart';
import '../../../bookMarket/presentation/cubit/save_article_cubit.dart';
import '../../../category/presentation/cubit/matches_cubit.dart';
import '../../../category/presentation/cubit/state/matches_state.dart';
import '../../../category/presentation/screens/match_screen.dart';
import '../../../category/presentation/widget/match_card_loading_widget.dart';
import '../../../category/presentation/widget/match_card_widget.dart';
import '../cubit/latest_news_cubit.dart';
import '../cubit/most_read_news_cubit.dart';
import '../cubit/search_article_cubit.dart';
import '../cubit/state/latest_news_state.dart';
import '../cubit/state/most_read_news_state.dart';
import '../cubit/state/trending_news_state.dart';
import '../cubit/trending_news_cubit.dart';
import '../cubit/weather_cubit.dart';
import '../widget/home_widget/home_tab_bar_widget.dart';
import '../widget/most_read_widget/most_read_loading_widget.dart';
import '../widget/now_news_widget/now_news_loading_widget.dart';
import '../widget/now_news_widget/now_news_widget.dart';
import '../widget/top_news_widget/top_news_loading_widget.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> with AutomaticKeepAliveClientMixin {
  late HomeTabModel selectedHomeTab = HomeTabModel.homeTabList(context)[0];
  int selectedHomeTabIndex = 0;
  final ScrollController scrollController = ScrollController();
  late PageController breakingController;
  late PageController trendingController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<BreakingNewsCubit>().getBreakingNews();
      context.read<MostReadNewsCubit>().getMostReadNews(top: 20);
      context.read<LatestNewsCubit>().getLatestNews(top: 20);
      context.read<TrendingNewsCubit>().getTrendingNews(top: 20);
    });
    context.read<MatchesCubit>().getMatches();
    Future.delayed(const Duration(milliseconds: 500), () {
      loadWeather();
    });
    breakingController = PageController(viewportFraction: 0.60);
    trendingController = PageController(viewportFraction: 0.60);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookMarketCubit>().loadSavedArticles();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    breakingController.dispose();
    trendingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Color bg = Theme.of(context).scaffoldBackgroundColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final tabs = HomeTabModel.homeTabList(context);
    return Scaffold(
      body: Column(
        children: [
          HomeHeaderWidget(
            onSearch: (keyword) {
              context.read<SearchCubit>().search(keyword: keyword);
            },
            onTap: () {
              scrollController.animateTo(
                0,

                duration: const Duration(milliseconds: 600),

                curve: Curves.easeInOut,
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: RefreshIndicator(
                color: ColorsManagers.red,
                onRefresh: () async {
                  await Future.wait([
                    context.read<BreakingNewsCubit>().getBreakingNews(),
                    context.read<MostReadNewsCubit>().getMostReadNews(top: 20),
                    context.read<LatestNewsCubit>().getLatestNews(top: 20),
                    context.read<TrendingNewsCubit>().getTrendingNews(top: 20),
                    context.read<MatchesCubit>().getMatches(),
                  ]);
                },
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    //nowNews
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          BlocBuilder<TrendingNewsCubit, TrendingNewsState>(
                            builder: (context, state) {
                              if (state is TrendingNewsLoading) {
                                return NowNewsLoadingWidget();
                              }
                              if (state is TrendingNewsError) {
                                return NowNewsLoadingWidget();
                              }
                              if (state is TrendingNewsSuccess &&
                                  state.articles.isNotEmpty) {
                                return NowNewsWidget(
                                  article: state.articles.first,
                                );
                              }
                              return const SizedBox();
                            },
                          ),

                          SizedBox(height: 10.h),

                          HomeTabBar(
                            homeTabList: tabs,
                            selectedHomeTabIndex: selectedHomeTabIndex,
                            onHomeTabItemSelected: (homeTabModel) {
                              setState(() {
                                selectedHomeTab = homeTabModel;
                                selectedHomeTabIndex = tabs.indexOf(
                                  homeTabModel,
                                );
                              });

                              if (homeTabModel.route != null) {
                                Navigator.pushNamed(
                                  context,
                                  homeTabModel.route!,
                                );
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
                      builder: (context, state) {
                        if (state is BreakingNewsLoading) {
                          return BreakingNewsLoadingWidget(
                            pageController: breakingController,
                          );
                        }
                        if (state is BreakingNewsError) {
                          return BreakingNewsLoadingWidget(
                            pageController: breakingController,
                          );
                        }
                        if (state is BreakingNewsSuccess) {
                          return SliverToBoxAdapter(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 250.h,
                                  child: PageView.builder(
                                    controller: breakingController,
                                    padEnds: false,
                                    itemCount: state.newsList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          end: 12.w,
                                        ),
                                        child: BreakingNewsItemWidget(
                                          news: state.newsList[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(height: 12.h),

                                SmoothPageIndicator(
                                  controller: breakingController,

                                  count: state.newsList.length,

                                  effect: ExpandingDotsEffect(
                                    dotHeight: 8.h,
                                    dotWidth: 8.w,

                                    activeDotColor: ColorsManagers.red,

                                    dotColor: ColorsManagers.gray2.withOpacity(
                                      0.5,
                                    ),

                                    expansionFactor: 4,

                                    spacing: 5.w,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                              ],
                            ),
                          );
                        }
                        return const SliverToBoxAdapter(child: SizedBox());
                      },
                    ),
                    //weather
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          WeatherWidget(),
                        ],
                      ),
                    ),
                    //matches
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Column(
                          children: [
                            SectionHeaderWidget(
                              title: appLocalizations.top_matches,
                              onViewAll: () {
                                showGeneralDialog(
                                  transitionDuration: const Duration(
                                    milliseconds: 200,
                                  ),
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel: '',
                                  pageBuilder: (_, __, ___) {
                                    final screenSize = MediaQuery.sizeOf(
                                      context,
                                    );

                                    return Center(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: screenSize.width - 32.w,
                                          maxHeight: screenSize.height - 80.h,
                                        ),
                                        child: Container(
                                          height: 700.h,
                                          width: 350.w,
                                          padding: EdgeInsets.all(16.sp),
                                          decoration: BoxDecoration(
                                            color: bg,
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          child: MatchScreen(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<MatchesCubit, MatchesState>(
                      builder: (context, state) {
                        if (state is MatchesLoading) {
                          return const SliverToBoxAdapter(
                            child: MatchCardLoadingWidget(),
                          );
                        }

                        if (state is MatchesError) {
                          return SliverToBoxAdapter(
                            child: MatchCardLoadingWidget(),
                          );
                        }
                        if (state is MatchesSuccess) {
                          final firstMatch = state.matches.first.matches.first;

                          return SliverToBoxAdapter(
                            child: MatchCardWidget(match: firstMatch),
                          );
                        }

                        return const SliverToBoxAdapter(child: SizedBox());
                      },
                    ),
                    //trendNews
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Column(
                          children: [
                            SectionHeaderWidget(
                              title: appLocalizations.trending_news,
                              onViewAll: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesManager.trendingNews,
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<TrendingNewsCubit, TrendingNewsState>(
                      builder: (context, state) {
                        if (state is TrendingNewsLoading) {
                          return BreakingNewsLoadingWidget(
                            pageController: trendingController,
                          );
                        }
                        if (state is TrendingNewsError) {
                          return BreakingNewsLoadingWidget(
                            pageController: trendingController,
                          );
                        }
                        if (state is TrendingNewsSuccess) {
                          return SliverToBoxAdapter(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 250.h,
                                  child: PageView.builder(
                                    controller: trendingController,
                                    padEnds: false,
                                    itemCount: state.articles.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          end: 12.w,
                                        ),
                                        child: BreakingNewsItemWidget(
                                          news: state.articles[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(height: 12.h),

                                SmoothPageIndicator(
                                  controller: trendingController,
                                  count: state.articles.length,

                                  effect: ExpandingDotsEffect(
                                    dotHeight: 8.h,
                                    dotWidth: 8.w,

                                    activeDotColor: ColorsManagers.red,

                                    dotColor: ColorsManagers.gray2.withOpacity(
                                      0.5,
                                    ),

                                    expansionFactor: 4,

                                    spacing: 5.w,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return const SliverToBoxAdapter(child: SizedBox());
                      },
                    ),
                    //topNews
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Column(
                          children: [
                            SectionHeaderWidget(
                              title: appLocalizations.latest_news,
                              onViewAll: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesManager.topNews,
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<LatestNewsCubit, LatestNewsState>(
                      builder: (context, state) {
                        if (state is LatestNewsLoading) {
                          return SliverToBoxAdapter(
                            child: SizedBox(
                              height: 1200.h,
                              child: TopNewsLoadingWidget(),
                            ),
                          );
                        }
                        if (state is LatestNewsError) {
                          return SliverToBoxAdapter(
                            child: SizedBox(
                              height: 1200.h,
                              child: TopNewsLoadingWidget(),
                            ),
                          );
                        }

                        if (state is LatestNewsSuccess) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),

                                child: TopNewsItemWidget(
                                  news: state.articles[index],
                                ),
                              );
                            }, childCount: state.articles.length),
                          );
                        }

                        return const SliverToBoxAdapter(child: SizedBox());
                      },
                    ),
                    //mostRead
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),

                          SectionHeaderWidget(
                            title: appLocalizations.most_read_news,
                            onViewAll: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.mostRead,
                              );
                            },
                          ),

                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    BlocBuilder<MostReadNewsCubit, MostReadNewsState>(
                      builder: (context, state) {
                        if (state is MostReadNewsLoading) {
                          return SliverToBoxAdapter(
                            child: SizedBox(
                              height: 1200.h,
                              child: MostReadLoadingWidget(),
                            ),
                          );
                        }

                        if (state is MostReadNewsError) {
                          return SliverToBoxAdapter(
                            child: SizedBox(
                              height: 1200.h,
                              child: MostReadLoadingWidget(),
                            ),
                          );
                        }

                        if (state is MostReadNewsSuccess) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 4.h),
                                child: MostReadNewsItemWidget(
                                  news: state.articles[index],
                                ),
                              );
                            }, childCount: state.articles.length),
                          );
                        }
                        return const SliverToBoxAdapter(child: SizedBox());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadWeather() async {
    try {
      final position = await LocationService.getCurrentLocation();
      await context.read<WeatherCubit>().getCurrentWeather(
        lat: position.latitude,
        lng: position.longitude,
        lang: "en",
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
