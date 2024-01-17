import 'dart:async';
import 'package:darkak_e_commerce_app/data/demo_product_list.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_listview.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_search_text_form_field.dart';
import 'package:darkak_e_commerce_app/screens/category_and_sub_category_screens/see_all_categories/see_all_categories_page.dart';
import 'package:darkak_e_commerce_app/screens/home_screens/home_page_components/brand_shop.dart';
import 'package:darkak_e_commerce_app/screens/home_screens/home_page_components/count_down_timer.dart';
import 'package:darkak_e_commerce_app/screens/home_screens/home_page_components/product_categories.dart';
import 'package:darkak_e_commerce_app/screens/home_screens/home_page_components/slider.dart';
import 'package:darkak_e_commerce_app/screens/product_listing_screen/product_listing_page.dart';
import 'package:darkak_e_commerce_app/screens/search_results_screen/search_page.dart';
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

  final ScrollController _scrollController = ScrollController();
  bool _showSearchIcon = false;

  Duration _duration = const Duration(hours: 12, minutes: 12, seconds: 12); // Initial duration
  late Timer _timer;
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(mounted){
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
          if (_duration.isNegative) {
            _timer.cancel();
            // Handle timer completion actions
          }
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
    _startTimer();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _showSearchIcon = _scrollController.offset > 40; // Adjust threshold as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 130.h,
            pinned: true,
            leading: Icon(
              Icons.location_on,
              size: 20.sp,
              color: orangeColor,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: myTextStyle(20.sp, FontWeight.normal, textColor),
                ),
                Text(
                  'Dhaka North, Banani Road No. 12 - 19',
                  style: myTextStyle(15.sp, FontWeight.normal, greyColor),
                ),
              ],
            ),
            actions: [
              if (_showSearchIcon)
                IconButton(
                  onPressed: () {
                    Get.to(() => const SearchPage());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 25.sp,
                    color: orangeColor,
                  ),
                ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 25.sp,
                  color: orangeColor,
                ),
              ),
              //show another search icon
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomSearchTextFormField(
                  onTap: () {
                    Get.to(() => const SearchPage());
                  },
                  readOnly: true,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Gap(16.h),
                  const SliderWithIndicator(),
                  Gap(16.h),
                  _productSectorName(onTap: (){Get.to(const SeeAllCategoriesPage());}, sectorName: 'Categories'),
                  Gap(8.h),
                  const ProductCategories(),
                  Gap(16.h),
                  CountDownTimer(duration: _duration),
                  Gap(16.h),
                  CustomProductItemListView(productList: demoProductList),
                  Gap(16.h),
                  _productSectorName(onTap: (){
                    Get.to(()=>ProductListingPage(productList: demoProductList));
                  }, sectorName: 'Best Selling'),
                  Gap(8.h),
                  CustomProductItemListView(productList: demoProductList.sublist(0,4)),
                  Gap(16.h),
                  _productSectorName(onTap: (){

                  }, sectorName: 'Featured Brands'),
                  Gap(8.h),
                  const BrandShop(),
                  Gap(16.h),
                  _productSectorName(onTap: (){
                    Get.to(()=>ProductListingPage(productList: demoProductList));
                  }, sectorName: 'New Arrival'),
                  Gap(8.h),
                  CustomProductItemListView(productList: demoProductList.sublist(0,4)),
                  Gap(16.h),
                  _productSectorName(onTap: (){
                    Get.to(()=>ProductListingPage(productList: demoProductList));
                  }, sectorName: 'Just For You'),
                  Gap(8.h),
                  CustomProductItemListView(productList: demoProductList.sublist(0,4)),
                  Gap(16.h),
                  _productSectorName(onTap: (){
                    Get.to(()=>ProductListingPage(productList: demoProductList));
                  }, sectorName: 'Top Trending(Week)'),
                  Gap(8.h),
                  CustomProductItemListView(
                      productList: demoProductList.sublist(0,4)),
                  Gap(16.h),
                  _productSectorName(onTap: (){
                    Get.to(()=>ProductListingPage(productList: demoProductList));
                  }, sectorName: 'Recent Added Products'),
                  Gap(8.h),
                  CustomProductItemListView(productList: demoProductList.sublist(0,4)),
                  Gap(16.h),
                ],
              ),
            ),
          )
        ],
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
