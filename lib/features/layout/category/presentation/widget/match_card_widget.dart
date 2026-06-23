import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/MatchModel.dart';

class MatchCardWidget extends StatelessWidget {
  final MatchModel match;

  const MatchCardWidget({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).scaffoldBackgroundColor;
    final Color canvasColor = Theme.of(context).canvasColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [canvasColor, bgColor],
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              match.status ?? "",
              style: textTheme.bodySmall?.copyWith(fontSize: 12.sp),
            ),
          ),

          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: match.homeTeamLogo ?? "",
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.sports_soccer),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      match.homeTeam ?? "",
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              /// Score
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${match.homeScore ?? ""}",
                      style: textTheme.bodyMedium,
                    ),

                    SizedBox(width: 12.w),

                    Text(
                      "-",
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: ColorsManagers.white,
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Text(
                      "${match.awayScore ?? ""}",
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              /// Away Team
              Expanded(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: match.awayTeamLogo ?? "",
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.sports_soccer),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      match.awayTeam ?? "",
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
