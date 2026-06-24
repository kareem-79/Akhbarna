import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/widget/arrow_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widget/search_widget.dart';
import '../../../../../l10n/app_localizations.dart';
import '../cubit/matches_cubit.dart';
import '../screens/match_screen.dart';

class CategoryHeaderWidget extends StatefulWidget {
  final String hintText;

  const CategoryHeaderWidget({super.key, required this.hintText});

  @override
  State<CategoryHeaderWidget> createState() => _CategoryHeaderWidgetState();
}

class _CategoryHeaderWidgetState extends State<CategoryHeaderWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    context.read<MatchesCubit>().getMatches();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color shadowColor = Theme.of(context).shadowColor;
    final Color bg = Theme.of(context).scaffoldBackgroundColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      height: 110.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorsManagers.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            ArrowBackWidget(backgroundColor: shadowColor, arrowGroundColor: bg),
            SizedBox(width: 12.w),
            Expanded(
              child: SearchWidget(
                hintText: widget.hintText,
                controller: searchController,
              ),
            ),

            SizedBox(width: 12.w),
            Visibility(
              visible: widget.hintText == appLocalizations.sports,
              replacement: const SizedBox.shrink(),
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: ColorsManagers.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    showGeneralDialog(
                      transitionDuration: const Duration(milliseconds: 200),
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '',
                      pageBuilder: (_, __, ___) {
                        return Center(
                          child: Container(
                            height: 700.h,
                            width: 350.w,
                            padding:  EdgeInsets.all(16.sp),
                            decoration: BoxDecoration(
                              color: bg,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child:  MatchScreen(),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.sports_soccer,
                    color: ColorsManagers.red,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
