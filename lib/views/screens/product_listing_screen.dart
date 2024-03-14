import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/models/product_model.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_searchview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_product_item_gridview.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_query_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key, required this.productList});

  final List<ProductModel> productList;

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
              child: CustomProductItemGridView(
                productList: productList,
                physics: const ScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
