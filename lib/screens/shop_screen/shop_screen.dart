import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/screens/search_product_screen/search_product_screen.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/controllers/product_list_controller.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_card_shimmer.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_query_tab.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends State<ShopScreen> {
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
            CustomSearchTextFormField(
              onTap: () {
               // Get.to(() => const SearchProductScreen());
              },
              readOnly: true,
            ),
            Gap(16.h),
            CustomQueryTab(productQueryList: ProductQuery.productQueryList),
            Gap(8.h),
            const CustomFilteringAndSorting(),
            Gap(16.h),
            Expanded(
              child: GetBuilder<ProductListController>(builder: (controller) {
                return controller.isLoading
                    ? _buildVerticalShimmerList
                    : _buildVerticalProductList(controller);
              }),
            ),
          ],
        ),
      ),
    );
  }

  MasonryGridView _buildVerticalProductList(ProductListController controller) {
    return MasonryGridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 26.h,
      crossAxisSpacing: 30.w,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CustomProductCard(
          product: controller.productsData[index],
        );
      },
      itemCount: controller.productsData.length,
    );
  }

  MasonryGridView get _buildVerticalShimmerList{
    return MasonryGridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 26.h,
      crossAxisSpacing: 30.w,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return const CustomProductCardShimmer();
      },
      itemCount: 6,
    );
  }
}
