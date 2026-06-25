import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/routes_managers.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../model/category_argument.dart';
import '../../../../../model/category_tab_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryTabModel category;
  final int index;
  final int newsCount;

  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.newsCount,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOddIndex = index % 2 != 0;
    final textTheme = Theme.of(context).textTheme;
    final colors = getCategoryGradient(category.id);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 400 + (index * 100)),
      tween: Tween<double>(begin: isOddIndex ? -100.0 : 100.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0.0),
          child: Opacity(
            opacity: (1 - (value.abs() / 100)).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          RoutesManager.categoryArticle,
          arguments: CategoryArguments(id: category.id, title: category.title),
        ),
        child: Container(
          height: 110.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  category.imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  alignment: isOddIndex
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    begin: isOddIndex
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    end: isOddIndex
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    colors: [
                      colors.last.withOpacity(.95),
                      colors.first.withOpacity(.75),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.45, 1.0],
                  ),
                ),
              ),

              Positioned(
                top: 0,
                bottom: 0,
                left: isOddIndex ? null : 20.w,
                right: isOddIndex ? 20.w : null,
                child: Center(
                  child: Icon(
                    isOddIndex
                        ? Icons.arrow_back_ios_rounded
                        : Icons.arrow_forward_ios_rounded,
                    color: ColorsManagers.white,
                    size: 28.sp,
                  ),
                ),
              ),

              Positioned(
                top: 0,
                bottom: 0,
                left: isOddIndex ? null : 60.w,
                right: isOddIndex ? 60.w : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isOddIndex
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(category.title, style: textTheme.bodyMedium),
                    SizedBox(height: 4.h),
                    Text(
                      "$newsCount ${appLocalizations.available_news_count}",
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 14.sp,
                        color: ColorsManagers.white2,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                left: 12.w,
                right: 12.w,
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                      colors: [colors.first, colors.last],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colors.last.withOpacity(.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> getCategoryGradient(String? categoryId) {
    switch (categoryId?.trim()) {
      case "رياضة":
        return [ColorsManagers.pinkLight, ColorsManagers.pinkDark];

      case "تكنولوجيا":
        return [ColorsManagers.mintLight, ColorsManagers.mintDark];

      case "سياسة":
        return [ColorsManagers.aquaLight, ColorsManagers.aquaDark];

      case "اقتصاد":
        return [ColorsManagers.yellowLight, ColorsManagers.yellowDark];

      case "صحة":
        return [ColorsManagers.purpleLight, ColorsManagers.purpleDark];

      case "فن":
        return [ColorsManagers.orangeLight, ColorsManagers.orangeDark];

      case "علوم":
        return [ColorsManagers.skyBlueLight, ColorsManagers.skyBlueDark];

      case "دولي":
        return [ColorsManagers.roseLight, ColorsManagers.roseDark];

      default:
        return [ColorsManagers.roseLight, ColorsManagers.roseDark];
    }
  }
}
