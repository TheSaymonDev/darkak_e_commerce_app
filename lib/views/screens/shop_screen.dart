import 'package:darkak_e_commerce_app/controllers/productList_controller.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/views/screens/final_product_details_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/search_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_product_card.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_query_tab.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_search_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
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
                Get.to(() => const SearchPage());
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
                    ? customCircularProgressIndicator
                    : MasonryGridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 26.h,
                        crossAxisSpacing: 30.w,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final product = controller.products[index];
                          final discountPercent = (product.regularPrice !=
                                      null &&
                                  product.offerPrice != null)
                              ? ((product.regularPrice! - product.offerPrice!) /
                                      product.regularPrice!) *
                                  100
                              : 0.0; // Or a suitable default value
                          return CustomProductCard(
                            productImgUrl: product.images![0].path,
                            productName: product.name,
                            productPrice: product.offerPrice,
                            discountPrice: product.regularPrice,
                            discount: discountPercent.toInt(),
                            onTap: () {
                              Get.to(() =>
                                  FinalProductDetailsScreen(products: product));
                            },
                          );
                        },
                        itemCount: controller.products.length,
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
