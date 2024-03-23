import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkak_e_commerce_app/controllers/add_to_wishList_controller.dart';
import 'package:darkak_e_commerce_app/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/final_product.dart';
import 'package:darkak_e_commerce_app/views/screens/final_product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;

  CustomProductCard({super.key, required this.product});

  final WishListItemController _wishListItemController = Get.find<WishListItemController>();

  @override
  Widget build(BuildContext context) {
    final discountPercent =
        (product.regularPrice != null && product.offerPrice != null)
            ? ((product.regularPrice! - product.offerPrice!) /
                    product.regularPrice!) *
                100
            : 0.0; // Or a suitable default value
    return Card(
        color: whiteClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Container(
            height: 324.h,
            width: 184.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r), color: whiteClr),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => FinalProductDetailsScreen(
                              product: product,
                            ));
                      },
                      child: Container(
                          height: 230.h,
                          width: double.infinity.w,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      '${Urls.imgUrl}${product.images![0].path}'),
                                  fit: BoxFit.cover)),
                          child: InkWell(
                              onTap: () async {
                                if (_wishListItemController
                                    .isInWishlist(product.id!)) {
                                  _wishListItemController
                                      .removeWishListItem(product.id!);
                                } else {
                                  Get.find<AddToWishListController>()
                                      .addToWishList(product.id!);
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 8.h, right: 8.w),
                                  height: 32.h,
                                  width: 32.w,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: whiteClr),
                                  child: GetBuilder<WishListItemController>(
                                      builder: (controller) {
                                    return Icon(
                                        controller.isInWishlist(product.id!)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 24.sp,
                                        color:
                                            controller.isInWishlist(product.id!)
                                                ? orangeClr
                                                : greyClr);
                                  }))))),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${product.name}',
                                style: Get.textTheme.bodyMedium),
                            Text('${Urls.takaSign}${product.offerPrice}',
                                style: Get.textTheme.bodyMedium),
                            Row(children: [
                              Text('${product.regularPrice}',
                                  style: Get.textTheme.bodySmall!.copyWith(
                                      color: greyClr,
                                      decoration: TextDecoration.lineThrough)),
                              Gap(10.w),
                              Text('-${discountPercent.toInt()}%',
                                  style: Get.textTheme.bodySmall!
                                      .copyWith(color: greyClr))
                            ])
                          ]))
                ])));
  }
}
