import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/colors_managers.dart';
import '../../../../../model/category_tab_model.dart';
import '../cubit/category_news_cubit.dart';
import '../cubit/category_news_state.dart';
import '../widget/category_item.dart';
import '../widget/category_loading_widget.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryNewsCubit>().getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: ColorsManagers.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.r),
                bottomRight: Radius.circular(60.r),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "صباح الخير\nإليكم بعض الأخبار",
                    style: textTheme.bodyLarge?.copyWith(fontSize: 28.sp),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CategoryNewsCubit, CategoryNewsState>(
              builder: (context, state) {
                if (state is CategoryNewsLoading) {
                  return const CategoryLoadingWidget();
                }

                if (state is CategoryNewsError) {
                  return Center(child: Text(state.message));
                }

                if (state is CategoryNewsSuccess) {
                  return ListView.separated(
                    padding: EdgeInsets.all(16.sp),
                    itemCount: CategoryTabModel.categories.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final categoryModel = CategoryTabModel.categories[index];

                      final matched = state.categoriesResponse.categories.where(
                            (e) => e.categoryName == categoryModel.id,
                      );

                      final newsCount = matched.isEmpty
                          ? 0
                          : matched.first.articles.length;

                      return CategoryItem(
                        category: categoryModel,
                        index: index,
                        newsCount: newsCount,
                      );
                    },
                  );
                }

                return const CategoryLoadingWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
