import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/data/best_selling.dart';
import 'package:e_commerce_app/data/flash_sale.dart';
import 'package:e_commerce_app/data/just_for_you.dart';
import 'package:e_commerce_app/data/new_arrival.dart';
import 'package:e_commerce_app/data/recent_added.dart';
import 'package:e_commerce_app/data/top_trending_week.dart';
import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/models/coupon_code_model.dart';
import 'package:e_commerce_app/models/product_offer_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_count_down_timer.dart';
import 'package:e_commerce_app/reusable/widgets/app_product_sector_card.dart';
import 'package:e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16.h),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 28.h,
                      width: 28.h,
                      alignment: Alignment.center,
                      decoration: shadowDecoration(),
                      child: Icon(
                        Icons.location_on,
                        size: 15.sp,
                        color: orangeColor,
                      ),
                    ),
                  ),
                  Gap(10.w),
                  Text(
                    'Location',
                    style: myTextStyle(20.sp, FontWeight.normal, textColor),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      alignment: Alignment.center,
                      decoration: shadowDecoration(),
                      child: Icon(
                        Icons.notifications,
                        size: 25.sp,
                        color: orangeColor,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Dhaka North, Banani Road No. 12 - 19',
                style: myTextStyle(15.sp, FontWeight.normal, greyColor),
              ),
              Gap(16.h),
              Row(
                children: [
                  const AppSearchTextFormField(),
                  Gap(30.w),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      alignment: Alignment.center,
                      decoration: shadowDecoration(),
                      child: Icon(
                        Icons.filter_list_outlined,
                        size: 25.sp,
                        color: orangeColor,
                      ),
                    ),
                  )
                ],
              ),
              Gap(16.h),
              CarouselSlider.builder(
                itemCount: ProductOfferModel.productOfferList.length,
                itemBuilder: (context, index, realIndex) => Container(
                  height: double.infinity.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                          image: AssetImage(
                              ProductOfferModel.productOfferList[index].imgUrl),
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
                  onDotClicked: (index) => setState(() => _currentPage = index),
                ),
              ),
              Gap(16.h),
              _productSectorName(sectorName: 'Categories'),
              Gap(8.h),
              SizedBox(
                height: 92.h,
                width: double.infinity,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final categoriesList =
                          CategoriesModel.categoriesList[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.h),
                            alignment: Alignment.center,
                            decoration: shadowDecoration(),
                            child: SvgPicture.asset(
                              categoriesList.iconUrl,
                            ),
                          ),
                          Text(
                            categoriesList.name,
                            style: myTextStyle(
                                20.sp, FontWeight.normal, textColor),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Gap(24.w),
                    itemCount: CategoriesModel.categoriesList.length),
              ),
              Gap(16.h),
              AppCountdownTimer(duration: _duration),
              Gap(16.h),
              SizedBox(
                height: 92.h,
                width: double.infinity,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          height: double.infinity,
                          width: 180.w,
                          padding: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: orangeColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  CouponCodeModel
                                      .couponCodeList[index].couponCode,
                                  style: myTextStyle(
                                      25.sp, FontWeight.normal, backgroundColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  'Get${CouponCodeModel.couponCodeList[index].discount}% Off',
                                  style: myTextStyle(
                                      15.sp, FontWeight.normal, backgroundColor),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){
                                  String copiedCode = CouponCodeModel.couponCodeList[index].couponCode;
                                  Clipboard.setData(ClipboardData(text: copiedCode));
                                  GetStorage().write('copyCode', 'Copied');
                                  final code = GetStorage().read('copyCode');
                                 Get.snackbar('Coupon Code',code, snackPosition: SnackPosition.BOTTOM, backgroundColor: orangeColor,colorText: backgroundColor);
                                },
                                child: Container(
                                  height: 25.h,
                                  width: double.infinity.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
                                    color: backgroundColor.withOpacity(0.8),
                                  ),
                                    child: Text('Copy Code', style: myTextStyle(15.sp, FontWeight.normal, textColor),),
                                ),
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => Gap(38.w),
                    itemCount: CouponCodeModel.couponCodeList.length),
              ),
              Gap(16.h),
              AppProductSectorCard(productList: flashSaleProductList),
              Gap(16.h),
              _productSectorName(sectorName: 'Best Selling'),
              Gap(8.h),
              AppProductSectorCard(productList: bestSellingProductList),
              Gap(16.h),
              _productSectorName(sectorName: 'New Arrival'),
              Gap(8.h),
              AppProductSectorCard(productList: newArrivalProductList),
              Gap(16.h),
              _productSectorName(sectorName: 'Just For You'),
              Gap(8.h),
              AppProductSectorCard(productList: justForYouProductList),
              Gap(16.h),
              _productSectorName(sectorName: 'Top Trending(Week)'),
              Gap(8.h),
              AppProductSectorCard(productList: topTrendingWeekProductList),
              Gap(16.h),
              _productSectorName(sectorName: 'Recent Added Products'),
              Gap(8.h),
              AppProductSectorCard(productList: recentAddedProductList),
              Gap(16.h),
            ],
          ),
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
