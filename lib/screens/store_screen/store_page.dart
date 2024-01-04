import 'package:darkak_e_commerce_app/data/demo_product_list.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_searchview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style_2.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_gridview.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_query_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarSearchviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          onTapSearch: () {}),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(16.h),
              CustomCardStyle2(
                  height: 100.h,
                  width: double.infinity.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 68.h,
                        width: 68.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/shop.png'),
                                fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Legacy Fashion',
                            style: myTextStyle(
                                15.sp, FontWeight.normal, textColor),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.follow_the_signs,
                                color: orangeColor,
                                size: 15.sp,
                              ),
                              Gap(4.w),
                              Text(
                                '2.9k',
                                style: myTextStyle(
                                    15.sp, FontWeight.normal, textColor),
                              ),
                            ],
                          ),
                          Text(
                            '85% positive seller ratings',
                            style: myTextStyle(
                                15.sp, FontWeight.normal, textColor),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFollowing = !_isFollowing;
                          });
                        },
                        child: _isFollowing == true
                            ? Container(
                                height: 34.h,
                                width: 100.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: orangeColor.withOpacity(0.5),
                                ),
                                child: Text(
                                  'Following',
                                  style: myTextStyle(
                                      20.sp, FontWeight.bold, backgroundColor),
                                ),
                              )
                            : Container(
                                height: 34.h,
                                width: 100.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: orangeColor),
                                child: Text(
                                  'Follow',
                                  style: myTextStyle(
                                      20.sp, FontWeight.bold, backgroundColor),
                                ),
                              ),
                      ),
                    ],
                  )),
              Gap(16.h),
              CustomQueryTab(productQueryList: ProductQuery.productQueryList),
              Gap(16.h),
              CustomFilteringAndSorting(filterTap: () {}, sortingTap: () {}),
              Gap(20.h),
              CustomProductItemGridView(
                  productList: demoProductList,
                  physics: const NeverScrollableScrollPhysics()),
            ],
          ),
        ),
      ),
    );
  }
}
