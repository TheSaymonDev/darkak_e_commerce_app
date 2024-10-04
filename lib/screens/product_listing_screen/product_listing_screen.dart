import 'package:darkak_e_commerce_app/screens/product_listing_screen/controllers/product_listing_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_searchview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_query_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductListingScreen extends StatelessWidget {
  ProductListingScreen({super.key});

  final _productListingController = Get.find<ProductListingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarSearchviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          onChanged: (value) {}),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Gap(16.h),
            CustomQueryTab(productQueryList: ProductQuery.productQueryList),
            Gap(8.h),
            const CustomFilteringAndSorting(
            ),
            Gap(16.h),
            Expanded(
              child: _buildVerticalProductList,
            ),
          ],
        ),
      ),
    );
  }

  MasonryGridView get _buildVerticalProductList{
    return MasonryGridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 26.h,
      crossAxisSpacing: 30.w,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CustomProductCard(
          product: _productListingController.productListData[index],
        );
      },
      itemCount: _productListingController.productListData.length,
    );
  }

}
