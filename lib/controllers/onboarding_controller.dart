import 'package:flutter/cupertino.dart';
import 'package:onboarding_screen/constants/onboarding/assets_string_contsants.dart';
import 'package:onboarding_screen/constants/onboarding/onboarding_description_constants.dart';
import 'package:onboarding_screen/constants/onboarding/onboarding_title_constants.dart';
import 'package:onboarding_screen/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageNavigation = PageController();
  forwardAction() {
    if (!isLastPage) {
      pageNavigation.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    } else {
      pageNavigation.page;
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(AssetsStringContants.book, OnboardingTitleConstant.titleOne,
        OnboardingDescriptionConstant.descriptionOne),
    OnboardingInfo(
        AssetsStringContants.bookGuy,
        OnboardingTitleConstant.titleTwo,
        OnboardingDescriptionConstant.descriptionTwo),
    OnboardingInfo(
        AssetsStringContants.bookLove,
        OnboardingTitleConstant.titleThree,
        OnboardingDescriptionConstant.descriptionThree),
    OnboardingInfo(
        AssetsStringContants.bookReading,
        OnboardingTitleConstant.titleFour,
        OnboardingDescriptionConstant.descriptionFour)
  ];
}
