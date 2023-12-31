import 'package:carousel_slider/carousel_slider.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/screens/authentication_screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/images/app-logo.svg', height: 208.h, width: 264.w, fit: BoxFit.cover,),
                    Gap(100.h),
                    Text(
                      'Start Your Journey',
                      style: myTextStyle(25.sp, FontWeight.bold, textColor),
                    ),
                    Gap(18.h),
                    Text(
                      'Lorem ipsum simply dummy text of the printing and typesetting industry',
                      style: myTextStyle(20.sp, FontWeight.normal, textColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                initialPage: 0,
                height: 569.h,
                autoPlay: true,
                viewportFraction: 1,
              ),
            ),
            Gap(30.h),
            SmoothPageIndicator(
              controller: PageController(initialPage: _currentPage),
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 5.0.h,
                dotWidth: 10.0,
                activeDotColor: orangeColor,
                dotColor: Colors.grey,
              ),
              onDotClicked: (index) => setState(() => _currentPage = index),
            ),
            const Spacer(),
            CustomOrangeButton(
              onPressed: () {
                Get.to(const SignInPage());
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
