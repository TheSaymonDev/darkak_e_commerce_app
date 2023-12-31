import 'dart:async';
import 'package:e_commerce_app/data/various_sectors/best_selling.dart';
import 'package:e_commerce_app/data/various_sectors/flash_sale.dart';
import 'package:e_commerce_app/data/various_sectors/just_for_you.dart';
import 'package:e_commerce_app/data/various_sectors/new_arrival.dart';
import 'package:e_commerce_app/data/various_sectors/recent_added.dart';
import 'package:e_commerce_app/data/various_sectors/top_trending_week.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/screens/category_and_sub_category_screens/see_all_categories/see_all_categories_page.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/brand_shop.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/count_down_timer.dart';
import 'package:e_commerce_app/reusable/widgets/custom_product_item_listview.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/fixed_search_bar.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/product_categories.dart';
import 'package:e_commerce_app/screens/home_screens/home_page_components/slider.dart';
import 'package:e_commerce_app/screens/product_listing_screen/product_listing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
                    _productSectorName(onTap: (){Get.to(const SeeAllCategoriesPage());}, sectorName: 'Categories'),
                    Gap(8.h),
                    const ProductCategories(),
                    Gap(16.h),
                    CountDownTimer(duration: _duration),
                    Gap(16.h),
                    //CouponCode(),
                    // Gap(16.h),
                    CustomProductItemListView(productList: flashSaleProductList),
                    Gap(16.h),
                    _productSectorName(onTap: (){
                      Get.to(()=>ProductListingPage(productList: bestSellingProductList));
                    }, sectorName: 'Best Selling'),
                    Gap(8.h),
                    CustomProductItemListView(productList: bestSellingProductList.sublist(0,4)),
                    Gap(16.h),
                    _productSectorName(onTap: (){

                    }, sectorName: 'Featured Brands'),
                    Gap(8.h),
                    const BrandShop(),
                    Gap(16.h),
                    _productSectorName(onTap: (){
                      Get.to(()=>ProductListingPage(productList: newArrivalProductList));
                    }, sectorName: 'New Arrival'),
                    Gap(8.h),
                    CustomProductItemListView(productList: newArrivalProductList.sublist(0,4)),
                    Gap(16.h),
                    _productSectorName(onTap: (){
                      Get.to(()=>ProductListingPage(productList: justForYouProductList));
                    }, sectorName: 'Just For You'),
                    Gap(8.h),
                    CustomProductItemListView(productList: justForYouProductList.sublist(0,4)),
                    Gap(16.h),
                    _productSectorName(onTap: (){
                      Get.to(()=>ProductListingPage(productList: topTrendingWeekProductList));
                    }, sectorName: 'Top Trending(Week)'),
                    Gap(8.h),
                    CustomProductItemListView(
                        productList: topTrendingWeekProductList.sublist(0,4)),
                    Gap(16.h),
                    _productSectorName(onTap: (){
                      Get.to(()=>ProductListingPage(productList: recentAddedProductList));
                    }, sectorName: 'Recent Added Products'),
                    Gap(8.h),
                    CustomProductItemListView(productList: recentAddedProductList.sublist(0,4)),
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

  Row _productSectorName({required void Function()? onTap, required String sectorName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectorName,
          style: myTextStyle(25.sp, FontWeight.bold, textColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: myTextStyle(20.sp, FontWeight.normal, textColor),
          ),
        ),
      ],
    );
  }
}



