import 'package:darkak_e_commerce_app/controllers/shop_controller.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
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
  final ShopController _shopController = Get.find<ShopController>();

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
              child: GetBuilder<ShopController>(builder: (controller) {
                return controller.isLoading==true? Center(child: customCircularProgressIndicator): MasonryGridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 26.h,
                  crossAxisSpacing: 30.w,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    // final productList = widget.productList[index];
                    // final discountAmount =
                    //     (productList.productPrice * productList.discounts) / 100;
                    // final discountPrice = productList.productPrice - discountAmount.toInt();
                    final product = controller.products![index];
                    return CustomProductCard(
                        productImgUrl: product['featured_image']['path'],
                        productName: product['name'],
                        productPrice: product['regular_price']);
                  },
                  itemCount: controller.products!.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
