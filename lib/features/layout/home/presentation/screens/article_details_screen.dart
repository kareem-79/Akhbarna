import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/utils/timer_format_helper.dart';
import 'package:akhbarna/core/widget/arrow_back_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/resources/colors_managers.dart';
import '../../../../../core/resources/constant.dart';
import '../../../../../core/utils/viewer_format_helper.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../auth/widget/custom_start_up_elevated_button.dart';
import '../../data/models/ArticleModel.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen({super.key});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    final Color cardColor = Theme.of(context).cardColor;
    final textTheme = Theme.of(context).textTheme;
    final Color shadowColor = Theme.of(context).shadowColor;
    final Color primaryColor = Theme.of(context).primaryColor;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(article.imageUrl ?? ""),
                    fit: BoxFit.fill,
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      ColorsManagers.black.withOpacity(0.3),
                      ColorsManagers.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ArrowBackWidget(),
                        Row(
                          children: [
                            Container(
                              width: 42.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  onTap: () {
                                    shareArticle(
                                      article.title ?? '',
                                      article.articleUrl ?? '',
                                    );
                                  },
                                  child: Icon(
                                    Icons.share_outlined,
                                    size: 20.sp,
                                    color: shadowColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 42.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                    });
                                  },
                                  child: Icon(
                                    isSelected
                                        ? Icons.bookmark
                                        : Icons.bookmark_border_outlined,
                                    size: 30.sp,
                                    color: shadowColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      article.title ?? "",
                      style: textTheme.bodyMedium?.copyWith(
                        color: primaryColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60.r),
                              child: CachedNetworkImage(
                                imageUrl:
                                    article.sourceLogoUrl ??
                                    article.sourceLogoFallbackUrl ??
                                    "",
                                width: 40.w,
                                height: 40.h,
                                fit: BoxFit.cover,
                                errorWidget: (_, __, ___) =>
                                    const Icon(Icons.newspaper),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.sp,
                                vertical: 5.sp,
                              ),
                              decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Center(
                                child: Text(
                                  article.sourceName ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.sp,
                            vertical: 5.sp,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsManagers.red.withOpacity(.3),
                            border: Border.all(color: ColorsManagers.red),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Text(
                              article.category ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      article.description ?? "",
                      style: textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.withOpacity(.2)),
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(.2),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoItem(
                            icon: Icons.access_time_outlined,
                            text: TimeFormatHelper.formatDate(
                              context,
                              article.publishedDate,
                            ),
                            textTheme: textTheme,
                          ),
                          _buildInfoItem(
                            icon: Icons.remove_red_eye_outlined,
                            text: ViewFormatHelper.formatViews(
                              context,
                              article.viewCount,
                            ),
                            textTheme: textTheme,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CustomStartUpElevatedButton(
                      onPress: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                        );

                        try {
                          final uri = Uri.parse(article.articleUrl ?? "");

                          await Future.delayed(
                            const Duration(milliseconds: 500),
                          );

                          Navigator.pop(context);

                          await launchUrl(uri, mode: LaunchMode.inAppWebView);
                        } catch (e) {
                          Navigator.pop(context);
                        }
                      },
                      backgroundColor: ColorsManagers.red,
                      foregroundColor: ColorsManagers.white,
                      text: appLocalizations.read_full_article,
                      path: IconManagers.more,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        socialMediaItem(
                          icon: IconManagers.facebook,
                          onTap: () {
                            shareToFacebook(context, article.articleUrl ?? "");
                          },
                          cardColor: cardColor,
                        ),
                        socialMediaItem(
                          icon: IconManagers.x,
                          onTap: () {
                            shareToTwitter(context, article.articleUrl ?? "");
                          },
                          cardColor: cardColor,
                        ),
                        socialMediaItem(
                          icon: IconManagers.whats,
                          onTap: () {
                            shareToWhatsApp(context, article.articleUrl ?? "");
                          },
                          cardColor: cardColor,
                        ),
                        socialMediaItem(
                          icon: IconManagers.share,
                          onTap: () {
                            shareArticle(
                              article.title ?? '',
                              article.articleUrl ?? '',
                            );
                          },
                          cardColor: cardColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String text,
    required TextTheme textTheme,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: ColorsManagers.gray3),
        SizedBox(width: 4.w),
        Text(
          text,
          style: textTheme.bodySmall?.copyWith(color: ColorsManagers.gray3),
        ),
      ],
    );
  }

  Widget socialMediaItem({
    required String icon,
    required VoidCallback onTap,
    required Color cardColor,
  }) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      width: 70.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Center(
          child: SvgPicture.asset(icon, width: 50.w, height: 50.h),
        ),
      ),
    );
  }

  Future<void> shareToFacebook(BuildContext context, String url) async {
    final Uri facebookUri = Uri.parse('${PlatformConstant.facebook}$url');

    if (await canLaunchUrl(facebookUri)) {
      await _launchWithLoading(context, facebookUri);
    }
  }

  Future<void> shareToTwitter(BuildContext context, String url) async {
    final Uri twitterUri = Uri.parse('${PlatformConstant.twitter}$url');

    await _launchWithLoading(context, twitterUri);
  }

  Future<void> shareToWhatsApp(BuildContext context, String url) async {
    final Uri whatsappUri = Uri.parse(
      '${PlatformConstant.whatsApp}${Uri.encodeComponent(url)}',
    );

    await _launchWithLoading(context, whatsappUri);
  }

  Future<void> shareArticle(String title, String url) async {
    await SharePlus.instance.share(
      ShareParams(
        subject: title,
        text:
            '''
📰 $title

${AppLocalizations.of(context)!.share_article_text}

$url
''',
      ),
    );
  }

  Future<void> _launchWithLoading(BuildContext context, Uri uri) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await Future.delayed(const Duration(milliseconds: 300));

      Navigator.pop(context);

      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      Navigator.pop(context);
    }
  }
}
