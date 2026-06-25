import 'package:akhbarna/features/layout/home/presentation/widget/most_read_widget/most_read_loading_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../model/category_argument.dart';
import '../../../home/presentation/widget/most_read_widget/most_read_news_item_widget.dart';
import '../cubit/category_news_cubit.dart';
import '../cubit/category_search_cubit.dart';
import '../cubit/state/category_news_state.dart';
import '../cubit/state/category_search_state.dart';
import '../widget/category_header_widget.dart';

class CategoryArticleScreen extends StatefulWidget {
  final CategoryArguments category;

  const CategoryArticleScreen({super.key, required this.category});

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
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: RefreshIndicator(
        color: ColorsManagers.red,
        onRefresh: () async {
          await context.read<CategoryNewsCubit>().getCategoryNews();
        },
        child: Column(
          children: [
            CategoryHeaderWidget(
              hintText: widget.category.title,
              categoryId: widget.category.id,
            ),
            Expanded(
              child: BlocBuilder<CategorySearchCubit, CategorySearchState>(
                builder: (context, searchState) {
                  if (searchState is CategorySearchLoading) {
                    return const Center(child: MostReadLoadingWidget());
                  }

                  if (searchState is CategorySearchSuccess) {
                    if (searchState.articles.isEmpty) {
                      return Center(
                        child: Text(appLocalizations.no_news_for_category),
                      );
                    }

                    return ListView.separated(
                      itemCount: searchState.articles.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.sp,
                        vertical: 4.h,
                      ),
                      separatorBuilder: (_, __) => const SizedBox(),
                      itemBuilder: (context, index) {
                        return MostReadNewsItemWidget(
                          news: searchState.articles[index],
                        );
                      },
                    );
                  }

                  return BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
                    builder: (context, state) {
                      if (state is CategoryNewsLoading) {
                        return const Center(child: MostReadLoadingWidget());
                      }

                      if (state is CategoryNewsError) {
                        return Center(child: Text(state.message));
                      }

                      if (state is CategoryNewsSuccess) {
                        final matched = state.categoriesResponse.categories
                            .where((e) => e.categoryName == widget.category.id);

                        if (matched.isEmpty) {
                          return Center(
                            child: Text(appLocalizations.no_news_for_category),
                          );
                        }

                        final category = matched.first;

                        return ListView.separated(
                          itemCount: category.articles.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.sp,
                            vertical: 4.h,
                          ),
                          separatorBuilder: (_, __) => const SizedBox(),
                          itemBuilder: (context, index) {
                            return MostReadNewsItemWidget(
                              news: category.articles[index],
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
