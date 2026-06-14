import 'package:akhbarna/features/layout/home/presentation/widget/most_read_widget/most_read_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../home/presentation/widget/most_read_widget/most_read_news_item_widget.dart';
import '../cubit/category_news_cubit.dart';
import '../cubit/category_news_state.dart';
import '../widget/category_header_widget.dart';

class CategoryArticleScreen extends StatefulWidget {
  final String categoryName;

  const CategoryArticleScreen({super.key, required this.categoryName});

  @override
  State<CategoryArticleScreen> createState() => _CategoryArticleScreenState();
}

class _CategoryArticleScreenState extends State<CategoryArticleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryNewsCubit>().getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: ColorsManagers.red,
        onRefresh: () async {
          await context.read<CategoryNewsCubit>().getCategoryNews();
        },
        child: Column(
          children: [
            CategoryHeaderWidget(hintText: widget.categoryName),
            BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
              builder: (context, state) {
                if (state is CategoryNewsLoading) {
                  return const Expanded(
                    child: Center(child: MostReadLoadingWidget()),
                  );
                }

                if (state is CategoryNewsError) {
                  return Expanded(
                    child: Center(child: MostReadLoadingWidget()),
                  );
                }

                if (state is CategoryNewsSuccess) {
                  final matched = state.categoriesResponse.categories.where(
                    (e) => e.categoryName == widget.categoryName,
                  );

                  if (matched.isEmpty) {
                    return const Expanded(
                      child: Center(child: Text('لا توجد أخبار لهذا القسم')),
                    );
                  }
                  final category = matched.first;
                  return Expanded(
                    child: ListView.separated(
                      itemCount: category.articles.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.sp,
                        vertical: 4.h,
                      ),
                      separatorBuilder: (_, __) => SizedBox(),

                      itemBuilder: (context, index) {
                        return MostReadNewsItemWidget(
                          news: category.articles[index],
                        );
                      },
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
