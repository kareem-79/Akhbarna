import 'package:akhbarna/features/layout/home/presentation/cubit/latest_news_cubit.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/top_news_widget/top_news_header_screen.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/top_news_widget/top_news_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../cubit/state/latest_news_state.dart';
import '../widget/top_news_widget/top_news_loading_widget.dart';

class TopNewsScreen extends StatefulWidget {
  const TopNewsScreen({super.key});

  @override
  State<TopNewsScreen> createState() => _TopNewsScreenState();
}

class _TopNewsScreenState extends State<TopNewsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<LatestNewsCubit>().getLatestNews(top: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopNewsHeaderWidget(),

          SizedBox(height: 10.h),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: RefreshIndicator(
                color: ColorsManagers.red,

                onRefresh: () async {
                  await context.read<LatestNewsCubit>().getLatestNews(top: 50);
                },
                child: BlocBuilder<LatestNewsCubit, LatestNewsState>(
                  builder: (context, state) {
                    if (state is LatestNewsLoading) {
                      return const TopNewsLoadingWidget();
                    }

                    if (state is LatestNewsError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is LatestNewsSuccess) {
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: state.articles.length,
                        separatorBuilder: (_, __) => SizedBox(height: 4.h),
                        itemBuilder: (context, index) {
                          return TopNewsItemWidget(news: state.articles[index]);
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
