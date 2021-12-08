import 'package:flutter/cupertino.dart';
import 'package:onboarding_screen/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
class OnboardingController extends GetxController {
var selectedPageIndex = 0.obs;
bool get isLastPage => selectedPageIndex.value == onboardingPages.length-1;
var pageNavigation = PageController();
forwardAction() {
  if(!isLastPage) {
    pageNavigation.nextPage(duration: 300.milliseconds, curve: Curves.ease );
  } else
  {
   pageNavigation.page;
  }
}
List<OnboardingInfo>  onboardingPages = [
  OnboardingInfo('assets/bookgirl.png', 'BooksHub', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be'),
  OnboardingInfo('assets/bookguy.png', 'Verified Authors', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be'),
  OnboardingInfo('assets/booklover.png', 'Readers are Leaders', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be'),
  OnboardingInfo('assets/bookreading.png', 'Books by Category', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be')
];
}