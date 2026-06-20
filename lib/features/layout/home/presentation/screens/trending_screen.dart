import 'package:akhbarna/features/layout/home/presentation/widget/most_read_widget/most_read_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../cubit/state/trending_news_state.dart';
import '../cubit/trending_news_cubit.dart';
import '../widget/most_read_widget/most_read_news_item_widget.dart';
import '../widget/now_news_widget/trending_header_widget.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    super.initState();

    context.read<TrendingNewsCubit>().getTrendingNews(top: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TrendingHeaderWidget(),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: RefreshIndicator(
                color: ColorsManagers.red,

                onRefresh: () async {
                  await context.read<TrendingNewsCubit>().getTrendingNews(
                    top: 50,
                  );
                },
                child: BlocBuilder<TrendingNewsCubit, TrendingNewsState>(
                  builder: (context, state) {
                    if (state is TrendingNewsLoading) {
                      return const MostReadLoadingWidget();
                    }

                    if (state is TrendingNewsError) {
                      return const MostReadLoadingWidget();
                    }

                    if (state is TrendingNewsSuccess) {
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: state.articles.length,

                        separatorBuilder: (context, index) {
                          return SizedBox(height: 4.h);
                        },

                        itemBuilder: (context, index) {
                          return MostReadNewsItemWidget(
                            news: state.articles[index],
                          );
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
