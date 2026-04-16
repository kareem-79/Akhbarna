import 'package:flutter/material.dart';

import '../../../../core/resources/assets_managers.dart';
import '../../../../l10n/app_localizations.dart';
import 'OnBoardingWidget.dart';
import 'on_boarding_item_widget.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController controller;
  final int currentIndex;
  final Function(int) onPageChanged;

  const OnBoardingPageView({
    super.key,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    List<OnBoardingWidget> pages = [
      OnBoardingWidget(
        image: ImageManagers.onBoarding1,
        title: appLocalizations.onboarding_title1,
        description: appLocalizations.onboarding_desc1,
      ),
      OnBoardingWidget(
        image: ImageManagers.onBoarding2,
        title: appLocalizations.onboarding_title2,
        description: appLocalizations.onboarding_desc2,
      ),
      OnBoardingWidget(
        image: ImageManagers.onBoarding3,
        title: appLocalizations.onboarding_title3,
        description: appLocalizations.onboarding_desc3,
      ),
      OnBoardingWidget(
        image: ImageManagers.onBoarding4,
        title: appLocalizations.onboarding_title4,
        description: "",
      ),
    ];
    return PageView.builder(
      controller: controller,
      itemCount: pages.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return OnBoardingItemWidget(
          model: pages[index],
          currentIndex: currentIndex,
          total: pages.length,
          controller: controller,
        );
      },
    );
  }
}
