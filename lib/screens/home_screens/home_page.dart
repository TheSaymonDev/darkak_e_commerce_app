import 'dart:async';
import 'package:e_commerce_app/data/best_selling.dart';
import 'package:e_commerce_app/data/flash_sale.dart';
import 'package:e_commerce_app/data/just_for_you.dart';
import 'package:e_commerce_app/data/new_arrival.dart';
import 'package:e_commerce_app/data/recent_added.dart';
import 'package:e_commerce_app/data/top_trending_week.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/brand_shop.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/count_down_timer.dart';
import 'package:e_commerce_app/reusable/widgets/app_item_listview.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/fixed_search_bar.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/product_categories.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Duration _duration =
      const Duration(hours: 12, minutes: 12, seconds: 12); // Initial duration
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration - const Duration(seconds: 1);
        if (_duration.isNegative) {
          _timer.cancel();
          // Handle timer completion actions
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16.h),
            const FixedSearchBar(),
            Gap(16.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SliderWithIndicator(),
                    Gap(16.h),
                    _productSectorName(sectorName: 'Categories'),
                    Gap(8.h),
                    const ProductCategories(),
                    Gap(16.h),
                    CountDownTimer(duration: _duration),
                    Gap(16.h),
                    //CouponCode(),
                    // Gap(16.h),
                    AppItemListView(productList: flashSaleProductList),
                    Gap(16.h),
                    _productSectorName(sectorName: 'Best Selling'),
                    Gap(8.h),
                    AppItemListView(productList: bestSellingProductList),
                    Gap(16.h),
                    _productSectorName(sectorName: 'Featured Brands'),
                    Gap(8.h),
                    const BrandShop(),
                    Gap(16.h),
                    _productSectorName(sectorName: 'New Arrival'),
                    Gap(8.h),
                    AppItemListView(productList: newArrivalProductList),
                    Gap(16.h),
                    _productSectorName(sectorName: 'Just For You'),
                    Gap(8.h),
                    AppItemListView(productList: justForYouProductList),
                    Gap(16.h),
                    _productSectorName(sectorName: 'Top Trending(Week)'),
                    Gap(8.h),
                    AppItemListView(
                        productList: topTrendingWeekProductList),
                    Gap(16.h),
                    _productSectorName(sectorName: 'Recent Added Products'),
                    Gap(8.h),
                    AppItemListView(productList: recentAddedProductList),
                    Gap(16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _productSectorName({required String sectorName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectorName,
          style: myTextStyle(25.sp, FontWeight.bold, textColor),
        ),
        Text(
          'See all',
          style: myTextStyle(20.sp, FontWeight.normal, textColor),
        ),
      ],
    );
  }
}



