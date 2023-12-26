import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/product_offer_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWithIndicator extends StatefulWidget {
  const SliderWithIndicator({super.key});

  @override
  State<SliderWithIndicator> createState() => _SliderWithIndicatorState();
}

class _SliderWithIndicatorState extends State<SliderWithIndicator> {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CarouselSlider.builder(
          itemCount: ProductOfferModel.productOfferList.length,
          itemBuilder: (context, index, realIndex) => Container(
            height: double.infinity.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                    image: AssetImage(ProductOfferModel
                        .productOfferList[index].imgUrl),
                    fit: BoxFit.cover)),
          ),
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
              initialPage: 0,
              height: 150.h,
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true),
        ),
        Gap(8.h),
        Center(
          child: SmoothPageIndicator(
            controller: PageController(initialPage: _currentPage),
            count: 3,
            effect: WormEffect(
              activeDotColor: orangeColor,
              dotColor: orangeColor.withOpacity(0.3),
              dotHeight: 10.h,
              dotWidth: 10.w,
            ),
            onDotClicked: (index) =>
                setState(() => _currentPage = index),
          ),
        ),
      ],
    );
  }
}
