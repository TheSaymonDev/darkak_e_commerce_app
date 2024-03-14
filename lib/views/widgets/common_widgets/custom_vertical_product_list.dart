import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/screens/final_product_details_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CustomVerticalProductList extends StatelessWidget {

  final List<Product>? productList;
  const CustomVerticalProductList({
    super.key,
    required this.productList
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 26.h,
      crossAxisSpacing: 30.w,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final product = productList![index];
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
      itemCount: productList!.length,
    );
  }
}