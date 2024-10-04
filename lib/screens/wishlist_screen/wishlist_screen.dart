import 'package:darkak_e_commerce_app/screens/wishlist_screen/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/product_details_screen.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListItemController>(builder: (controller) {
      return SafeArea(
        child: controller.isLoading
            ? customCircularProgressIndicator
            : controller.wishListItemsData.isEmpty
                ? Center(child: Lottie.asset(AppUrls.emptyWishListLottie))
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(top: 16.h),
                      itemBuilder: (context, index) {
                        final product = controller.wishListItemsData[index];
                        return GestureDetector(
                          onTap: () {
                            // Get.to(() =>
                            //     ProductDetailsScreen(product: product));
                          },
                          child: CustomCard(
                            width: double.infinity.w,
                            child: Row(
                              children: [
                                Container(
                                  height: 120.h,
                                  width: 120.w,
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${AppUrls.imgUrl}${product.images![0].path}'),
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                Gap(40.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${product.name}',
                                          style: Get.textTheme.bodyLarge),
                                      Text(
                                        '${AppUrls.takaSign}${product.offerPrice}',
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(color: orangeClr),
                                      ),
                                      Gap(10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('${product.regularPrice}',
                                                  style: Get
                                                      .textTheme.bodySmall!
                                                      .copyWith(
                                                          color: greyClr,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough)),
                                              Gap(16.w),
                                              Text('-10%',
                                                  style: Get
                                                      .textTheme.bodySmall!
                                                      .copyWith(
                                                          color: greyClr)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: yellowClr,
                                                  size: 20.sp),
                                              Text('4.5',
                                                  style: Get.textTheme.bodyMedium),
                                              Gap(16.w),
                                              InkWell(
                                                onTap: () async {
                                                  controller.removeWishListItem(product.id!);
                                                },
                                                child: Icon(
                                                  Icons.favorite,
                                                  size: 25.sp,
                                                  color: orangeClr,
                                                ),
                                              ),
                                              Gap(16.w),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Gap(8.h),
                      itemCount: controller.wishListItemsData.length,
                    ),
                  ),
      );
    });
  }
}
