import 'package:e_commerce_app/data/favourite.dart';
import 'package:e_commerce_app/data/recommended.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_item_gridview.dart';
import 'package:e_commerce_app/screens/filter_and_sort_screens/filter_page.dart';
import 'package:e_commerce_app/screens/wishlist_screen/favourite_page_components/favourite_items.dart';
import 'package:e_commerce_app/screens/wishlist_screen/favourite_page_components/filter_and_sorting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Gap(16.h),
            FilterAndSorting(filterTap: (){Get.to(const FilterPage());}, sortingTap: (){}),
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                      child: FavouriteItem(),
                    ),
                    Gap(36.h),
                    Text(
                      'Recommended',
                      style: myTextStyle(25.sp, FontWeight.bold, textColor),
                    ),
                    Gap(16.h),
                    AppItemGridView(productList: recommendedProductList, physics: const NeverScrollableScrollPhysics(),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
