import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/utils/timer_format_helper.dart';
import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:akhbarna/l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/routes_managers.dart';
import '../../../../../../core/utils/viewer_format_helper.dart';
import '../../../../../core/utils/ui_utils.dart';
import '../cubit/save_article_cubit.dart';
import '../cubit/save_article_state.dart';

class BookMarketNewsItemWidget extends StatefulWidget {
  final ArticleModel news;
  final bool selectionMode;
  final bool isSelected;
  final VoidCallback? onSelect;
  final VoidCallback? onLongSelect;
  const BookMarketNewsItemWidget({
    super.key,
    required this.news,
    this.selectionMode = false,
    this.isSelected = false,
    this.onSelect, this.onLongSelect,
  });

  @override
  State<BookMarketNewsItemWidget> createState() =>
      _BookMarketNewsItemWidgetState();
}

class _BookMarketNewsItemWidgetState extends State<BookMarketNewsItemWidget> {
  @override
  void initState() {
    super.initState();
  }

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
        onLongPress: () {
          if (!widget.selectionMode) {
            widget.onLongSelect?.call();
          }
        },
        onTap: () {
          if (widget.selectionMode) {
            widget.onSelect?.call();
            return;
          }

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
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
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
                      width: 100.w,
                      height: 130.h,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    color: getCategoryColor(
                                      widget.news.category,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  widget.news.category ?? "",
                                  style: textTheme.bodySmall?.copyWith(
                                    color: getCategoryColor(
                                      widget.news.category,
                                    ),
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
                                final bool isSaved =
                                    state is BookMarketSuccess &&
                                    state.savedIds.contains(widget.news.id);
                                return Container(
                                  width: 42.w,
                                  height: 42.h,
                                  decoration: BoxDecoration(
                                    color: getCategoryColor(
                                      widget.news.category,
                                    ).withOpacity(.3),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20.r),
                                      onTap: state is BookMarketLoading
                                          ? null
                                          : () {
                                              context
                                                  .read<BookMarketCubit>()
                                                  .toggleBookmark(widget.news);
                                            },
                                      child: state is BookMarketLoading
                                          ? SizedBox(
                                              width: 20.w,
                                              height: 20.h,
                                              child:
                                                  const CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                  ),
                                            )
                                          : Icon(
                                              isSaved
                                                  ? Icons.bookmark
                                                  : Icons
                                                        .bookmark_border_outlined,
                                              size: 25.sp,
                                              color: getCategoryColor(
                                                widget.news.category,
                                              ),
                                            ),
                                    ),
                                  ),
                                );
                              },
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
            if (widget.selectionMode)
              PositionedDirectional(
                top: 10,
                start: 10,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: widget.isSelected
                      ? ColorsManagers.red
                      : ColorsManagers.white,
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: widget.isSelected
                        ? ColorsManagers.white
                        : Colors.transparent,
                  ),
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
