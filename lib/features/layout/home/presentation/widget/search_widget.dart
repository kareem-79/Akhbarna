import 'package:akhbarna/features/layout/home/presentation/widget/top_news_widget/top_news_item_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/search_widget.dart';
import '../cubit/search_article_cubit.dart';
import '../cubit/state/search_article_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    context.read<SearchCubit>().clearSearch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SearchWidget(
                controller: controller,
                hintText: appLocalizations.search,
                onSubmitted: (value) {
                  context.read<SearchCubit>().search(keyword: value);
                },
              ),
            ),

            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return  Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is SearchSuccess) {
                    if (state.articles.isEmpty) {
                      return  Center(child: Text("لا توجد نتائج",style: textTheme.bodyMedium,));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TopNewsItemWidget(news: state.articles[index]),
                        );
                      },
                    );
                  }
                  return Center(child: Text(appLocalizations.search));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
