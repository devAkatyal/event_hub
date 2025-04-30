import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'package:event_hub/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/events_upcoming.png',
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/events_upcoming2.png',
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/events_upcoming3.png',
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.titles[controller.currentPage.value],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Airbnb',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        controller.description[controller.currentPage.value],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Airbnb',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: controller.skipToEnd,
                            child: Text(
                              'Skip',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Airbnb',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0x7FFFFFFF),
                              ),
                            ),
                          ),

                          SmoothPageIndicator(
                            controller: controller.pageController,
                            count: controller.numPages,
                            effect: const WormEffect(
                              dotColor: Colors.white30,
                              activeDotColor: Colors.white,
                              dotHeight: 8.0,
                              dotWidth: 8.0,
                            ),
                            onDotClicked: controller.goToPage,
                          ),
                          TextButton(
                            onPressed: controller.goToNextPage,
                            child: Text(
                              'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Airbnb',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF5669FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final OnboardingController controller = Get.put(OnboardingController());
}
