import 'package:akhbarna/features/layout/home/presentation/cubit/most_read_news_cubit.dart';
import 'package:akhbarna/features/layout/home/presentation/cubit/most_read_news_state.dart';
import 'package:akhbarna/features/layout/home/presentation/widget/most_read_widget/most_read_news_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../widget/most_read_widget/most_read_header_widget.dart';
import '../widget/most_read_widget/most_read_loading_widget.dart';

class MostReadScreen extends StatefulWidget {
  const MostReadScreen({super.key});

  @override
  State<MostReadScreen> createState() => _MostReadScreenState();
}

class _MostReadScreenState extends State<MostReadScreen> {
  @override
  void initState() {
    super.initState();

    context.read<MostReadNewsCubit>().getMostReadNews(top: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MostReadHeaderWidget(),

          SizedBox(height: 10.h),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.sp),

              child: RefreshIndicator(
                color: ColorsManagers.red,

                onRefresh: () async {
                  await context.read<MostReadNewsCubit>().getMostReadNews(
                    top: 50,
                  );
                },
                child: BlocBuilder<MostReadNewsCubit, MostReadNewsState>(
                  builder: (context, state) {
                    if (state is MostReadNewsLoading) {
                      return const MostReadLoadingWidget();
                    }

                    if (state is MostReadNewsError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is MostReadNewsSuccess) {
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: state.articles.length,

                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10.h);
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
