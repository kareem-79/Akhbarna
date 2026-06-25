import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/utils/timer_format_helper.dart';
import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../core/resources/routes_managers.dart';
import '../../../../../../core/utils/ui_utils.dart';
import '../../../../../../core/utils/viewer_format_helper.dart';
import '../../../../bookMarket/presentation/cubit/save_article_cubit.dart';
import '../../../../bookMarket/presentation/cubit/save_article_state.dart';

class MostReadNewsItemWidget extends StatefulWidget {
  final ArticleModel news;

  const MostReadNewsItemWidget({super.key, required this.news});

  @override
  State<MostReadNewsItemWidget> createState() => _MostReadNewsItemWidgetState();
}

class _MostReadNewsItemWidgetState extends State<MostReadNewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Color shadowColor = Theme.of(context).shadowColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300 + (widget.news.hashCode % 5) * 100),
      tween: Tween<double>(begin: 40.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: Opacity(
            opacity: (1 - value / 40).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutesManager.articleDetails,
            arguments: widget.news,
          );
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 44.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: shadowColor),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: CachedNetworkImage(
                      imageUrl: widget.news.imageUrl ?? "",
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          Container(color: Colors.grey.shade300),
                      errorWidget: (_, __, ___) => Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 6.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                color: getCategoryColor(widget.news.category),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              widget.news.category ?? "",
                              style: textTheme.bodySmall?.copyWith(
                                color: getCategoryColor(widget.news.category),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Container(
                              width: 3.w,
                              height: 3.w,
                              decoration: BoxDecoration(
                                color: ColorsManagers.gray3,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              widget.news.sourceName ?? "",
                              style: textTheme.bodySmall?.copyWith(
                                color: ColorsManagers.gray3,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          widget.news.title ?? "",
                          textAlign: TextAlign.right,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${appLocalizations.ago} ${TimeFormatHelper.formatDate(context, widget.news.publishedDate)}",
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                                color: ColorsManagers.gray3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(width: 6.w),

                            Container(
                              width: 3.w,
                              height: 3.w,
                              decoration: BoxDecoration(
                                color: ColorsManagers.gray3,
                                shape: BoxShape.circle,
                              ),
                            ),

                            SizedBox(width: 6.w),

                            Flexible(
                              child: Row(
                                children: [
                                  Text(
                                    ViewFormatHelper.formatViews(
                                      context,
                                      widget.news.viewCount,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                      color: ColorsManagers.gray3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Icon(
                                    Icons.visibility,
                                    size: 12.sp,
                                    color: ColorsManagers.gray3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              end: 8.w,
              bottom: 20.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocConsumer<BookMarketCubit, BookMarketState>(
                    listener: (context, state) {
                      if (state is BookMarketError) {
                        UiUtils.showToast(
                          context,
                          state.message,
                          ColorsManagers.red,
                        );
                      }
                    },
                    builder: (context, state) {
                      final isSaved =
                          state is BookMarketSuccess &&
                              state.savedIds.contains(widget.news.id);

                      return InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: state is BookMarketLoading
                            ? null
                            : () {
                          context
                              .read<BookMarketCubit>()
                              .toggleBookmark(widget.news);
                        },
                        child: Container(
                          padding: EdgeInsets.all(6.sp),
                          decoration: BoxDecoration(
                            color: ColorsManagers.dark,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: getCategoryColor(
                                widget.news.category,
                              ).withOpacity(.25),
                            ),
                          ),
                          child: state is BookMarketLoading
                              ? SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                              : Icon(
                            isSaved
                                ? Icons.bookmark_rounded
                                : Icons.bookmark_border_rounded,
                            size: 20.sp,
                            color: getCategoryColor(widget.news.category),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(width: 8.w),

                  InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    onTap: () {
                      SharePlus.instance.share(
                        ShareParams(text: widget.news.articleUrl ?? ''),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(6.sp),
                      decoration: BoxDecoration(
                        color: ColorsManagers.dark,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: getCategoryColor(
                            widget.news.category,
                          ).withOpacity(.25),
                        ),
                      ),
                      child: Icon(
                        Icons.share_outlined,
                        size: 20.sp,
                        color: getCategoryColor(widget.news.category),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getCategoryColor(String? category) {
    switch (category?.trim()) {
      case "رياضة":
        return ColorsManagers.pinkDark;

      case "تكنولوجيا":
        return ColorsManagers.mintDark;

      case "سياسة":
        return ColorsManagers.aquaDark;

      case "اقتصاد":
        return ColorsManagers.yellowDark;

      case "صحة":
        return ColorsManagers.purpleDark;

      case "ترفيه":
        return ColorsManagers.orangeDark;

      case "علوم":
        return ColorsManagers.skyBlueDark;

      case "دولي":
        return ColorsManagers.roseDark;

      default:
        return ColorsManagers.roseDark;
    }
  }
}
