import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/features/layout/category/presentation/widget/match_card_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/matches_cubit.dart';
import '../cubit/matches_state.dart';
import '../widget/match_card_widget.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final Color bg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MatchesCubit, MatchesState>(
          builder: (context, state) {
            if (state is MatchesLoading) {
              return MatchCardLoadingWidget();
            }

            if (state is MatchesError) {
              return MatchCardLoadingWidget();
            }
            if (state is MatchesSuccess) {
              return RefreshIndicator(
                color: ColorsManagers.red,
                onRefresh: () async {
                  context.read<MatchesCubit>().getMatches();
                },
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: state.matches.length,
                  itemBuilder: (context, index) {
                    final day = state.matches[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                day.matches.isNotEmpty
                                    ? day.matches.first.league ?? ""
                                    : "",
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: bg,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  day.dateLabel ?? "",
                                  style: textTheme.bodySmall?.copyWith(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding:  EdgeInsets.all(8.0.sp),
                            child: Text(
                              day.label ?? "",
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        ...day.matches.map(
                          (match) => Padding(
                            padding: EdgeInsets.only(
                              left: 12.w,
                              right: 12.w,
                              bottom: 12.h,
                            ),
                            child: MatchCardWidget(match: match),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
