import 'package:akhbarna/features/layout/home/presentation/widget/weather_widget/weather_loading_widget.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors_managers.dart';
import '../../cubit/state/weather_state.dart';
import '../../cubit/weather_cubit.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  Widget weatherChip({
    required BuildContext context,
    required IconData icon,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.08),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.sp, color: Colors.white70),
          SizedBox(width: 4.w),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final canvasColor = Theme.of(context).canvasColor;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final shadowColor = Theme.of(context).shadowColor;

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const WeatherLoadingWidget();
        }

        if (state is WeatherError) {
          return const WeatherLoadingWidget();
        }

        if (state is WeatherSuccess) {
          final weather = state.weather;

          return Container(
            constraints: BoxConstraints(minHeight: 140.h),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [canvasColor, bgColor],
              ),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: ColorsManagers.white.withOpacity(.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: shadowColor.withOpacity(.15),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        appLocalizations.now,
                        style: textTheme.bodySmall?.copyWith(fontSize: 10.sp),
                      ),
                    ),

                    const Spacer(),



                    Expanded(
                      child: Text(
                        "${weather.location.name}, ${weather.location.country}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: textTheme.bodySmall?.copyWith(fontSize: 11.sp),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.location_on_rounded,
                      color: shadowColor,
                      size: 14.sp,
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${weather.current.tempC?.round() ?? 0}°",
                            style: textTheme.bodyLarge?.copyWith(
                              fontSize: 38.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Text(
                            weather.current.condition.text ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyMedium?.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Image.network(
                      "https:${weather.current.condition.icon}",
                      width: 70.w,
                      height: 70.h,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.cloud,
                        size: 45.sp,
                        color: ColorsManagers.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                Wrap(
                  spacing: 6.w,
                  runSpacing: 6.h,
                  children: [
                    weatherChip(
                      context: context,
                      icon: Icons.water_drop,
                      value: "${weather.current.humidity ?? 0}%",
                    ),
                    weatherChip(
                      context: context,
                      icon: Icons.air,
                      value: "${weather.current.windKph?.round() ?? 0} km/h",
                    ),
                    weatherChip(
                      context: context,
                      icon: Icons.location_on,
                      value: appLocalizations.location,
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return const WeatherLoadingWidget();
      },
    );
  }
}
