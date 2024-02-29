import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/widgets/wishlist_screen_widgets/favourite_items.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_product_item_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
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
                      style: myStyle(25.sp, FontWeight.bold, blackClr),
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
