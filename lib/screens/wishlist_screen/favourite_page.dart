import 'package:darkak_e_commerce_app/data/demo_product_list.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_gridview.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/favourite_page_components/favourite_items.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_filtering_and_sorting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
            const CustomFilteringAndSorting(),
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
                    CustomProductItemGridView(productList: demoProductList, physics: const NeverScrollableScrollPhysics(),)
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
