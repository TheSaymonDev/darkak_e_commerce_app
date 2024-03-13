import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/screens/final_product_details_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  final List<Product>? productList;
  const ProductList({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 324.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final product = productList![index];
            final discountPercent =
                (product.regularPrice != null && product.offerPrice != null)
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
                Get.to(()=> FinalProductDetailsScreen(products: product));
              },
            );
          },
          separatorBuilder: (context, index) => Gap(16.w),
          itemCount: productList!.length),
    );
  }
}
