import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/core/widget/custom_text_button.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/breaking_news_cubit.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/breaking_news_state.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/breaking_widget/breaking_news_item_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/breaking_widget/breaking_news_loading_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/home_widget/home_header_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/most_read_widget/most_read_news_item_widget.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/top_news_widget/top_news_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/widget/section_header_widget.dart';
import '../../../../../model/home_tab_model.dart';
import '../../../../../provider/book_market_provider.dart';
import '../cubit/latest_news_cubit.dart';
import '../cubit/latest_news_state.dart';
import '../cubit/most_read_news_cubit.dart';
import '../cubit/most_read_news_state.dart';
import '../widget/home_widget/home_tab_bar_widget.dart';
import '../widget/most_read_widget/most_read_loading_widget.dart';
import '../widget/now_news_widget.dart';
import '../widget/top_news_widget/top_news_loading_widget.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late HomeTabModel selectedHomeTab = HomeTabModel.homeTabList(context)[0];

  final ScrollController scrollController = ScrollController();

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    context.read<BreakingNewsCubit>().getBreakingNews();

    context.read<MostReadNewsCubit>().getMostReadNews(top: 20);

    context.read<LatestNewsCubit>().getLatestNews(top: 20);
  }

  @override
  void dispose() {
    scrollController.dispose();

    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeaderWidget(
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
                  await context.read<BreakingNewsCubit>().getBreakingNews();
                  await context.read<MostReadNewsCubit>().getMostReadNews(
                    top: 20,
                  );
                  await context.read<LatestNewsCubit>().getLatestNews(top: 20);
                },
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const NowNewsWidget(),

                          SizedBox(height: 10.h),

                          HomeTabBar(
                            homeTabList: HomeTabModel.homeTabList(context),
                            selectedHomeTabIndex: 0,

                            onHomeTabItemSelected: (homeTabModel) {
                              setState(() {
                                selectedHomeTab = homeTabModel;
                              });

                              if (homeTabModel.id == '2') {
                                Navigator.pushNamed(
                                  context,
                                  RoutesManager.topNews,
                                );
                              } else if (homeTabModel.id == '3') {
                                Navigator.pushNamed(
                                  context,
                                  RoutesManager.mostRead,
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
                            pageController: pageController,
                          );
                        }
                        if (state is BreakingNewsError) {
                          return SliverToBoxAdapter(
                            child: Center(child: Text(state.message)),
                          );
                        }
                        if (state is BreakingNewsSuccess) {
                          return SliverToBoxAdapter(
                            child: Consumer<BookmarkProvider>(
                              builder: (context, provider, _) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 220.h,

                                      child: PageView.builder(
                                        controller: pageController,

                                        itemCount: state.newsList.length,

                                        itemBuilder: (context, index) {
                                          return BreakingNewsItemWidget(
                                            news: state.newsList[index],
                                          );
                                        },
                                      ),
                                    ),

                                    SizedBox(height: 12.h),

                                    SmoothPageIndicator(
                                      controller: pageController,

                                      count: state.newsList.length,

                                      effect: ExpandingDotsEffect(
                                        dotHeight: 8.h,
                                        dotWidth: 8.w,

                                        activeDotColor: ColorsManagers.red,

                                        dotColor: ColorsManagers.gray2
                                            .withOpacity(0.5),

                                        expansionFactor: 4,

                                        spacing: 5.w,
                                      ),
                                    ),
                                  ],
                                );
                              },
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
                              title: "🕐 آخر الأخبار",
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
                            child: Center(child: Text(state.message)),
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
                            title: "📖 الاكثر قراءة",
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
                            child: Center(child: Text(state.message)),
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
}
