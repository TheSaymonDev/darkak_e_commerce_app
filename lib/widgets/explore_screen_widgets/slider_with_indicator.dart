import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:darkak_e_commerce_app/screens/explore_screen/controllers/explore_screen_controller.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/models/product_offer_model.dart';
import 'package:darkak_e_commerce_app/screens/store_screen/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWithIndicator extends StatelessWidget {
  const SliderWithIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GetBuilder<ExploreScreenController>(builder: (controller) {
        return CarouselSlider.builder(
            itemCount: ProductOfferModel.productOfferList.length,
            itemBuilder: (context, index, realIndex) => GestureDetector(
                onTap: () {
                  // Get.to(() => const StorePage());
                },
                child: Container(
                    height: double.infinity.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: AssetImage(ProductOfferModel
                                .productOfferList[index].imgUrl),
                            fit: BoxFit.cover)))),
            options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    controller.sliderChange(index),
                initialPage: 0,
                height: 150.h,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true));
      }),
      Gap(8.h),
      Center(child: GetBuilder<ExploreScreenController>(builder: (controller) {
        return SmoothPageIndicator(
          controller: PageController(initialPage: controller.currentPage),
          count: 3,
          effect: WormEffect(
            activeDotColor: orangeClr,
            dotColor: orangeClr.withValues(alpha: 0.3),
            dotHeight: 10.h,
            dotWidth: 10.w,
          ),
          onDotClicked: (index) => controller.sliderChange(index),
        );
      }))
    ]);
  }
}
