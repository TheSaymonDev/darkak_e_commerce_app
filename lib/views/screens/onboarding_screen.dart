import 'package:carousel_slider/carousel_slider.dart';
import 'package:darkak_e_commerce_app/controllers/onboarding_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<OnboardingController>(
              builder: (controller) {
                return CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/images/app-logo.svg',
                          height: 208.h,
                          width: 264.w,
                          fit: BoxFit.cover,
                        ),
                        Gap(100.h),
                        Text(
                          'Start Your Journey',
                          style: Get.textTheme.titleLarge,
                        ),
                        Gap(18.h),
                        Text(
                          'Lorem ipsum simply dummy text of the printing and typesetting industry',
                          style: Get.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) => controller.onPageChange(index),
                    initialPage: 0,
                    height: 569.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                );
              },
            ),
            Gap(30.h),
            GetBuilder<OnboardingController>(
              builder: (controller) {
                return SmoothPageIndicator(
                  controller: PageController(initialPage: controller.currentPage),
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 5.0.h,
                    dotWidth: 10.0.w,
                    activeDotColor: orangeClr,
                    dotColor: Colors.grey,
                  ),
                  onDotClicked: (index) => controller.onDotClick(index),
                );
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () {
                Get.to(() => SignInScreen());
              },
              buttonName: 'Get Start',
              width: 310.w,
            ),
            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
