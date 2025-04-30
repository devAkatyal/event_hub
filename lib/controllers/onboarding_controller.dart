import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  final int numPages = 3;

  late PageController pageController;

  final List<String> titles = [
    " Explore Upcoming and Nearby Events ",
    " Web Have Modern Events Calendar Feature ",
    "  To Look Up More Events or Activities Nearby By Map ",
  ];

  final List<String> description = [
    "In publishing and graphic design, Lorem is a placeholder text commonly",
    "Find the perfect spot for your next outing or gathering easily.",
    "See what events your friends are attending and join them.",
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToNextPage() {
    if (currentPage.value == numPages - 1) {
      Get.offAllNamed('/login');
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToEnd() {
    Get.offAllNamed('/login');
  }

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
