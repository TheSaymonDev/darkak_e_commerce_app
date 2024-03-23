import 'package:darkak_e_commerce_app/controllers/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/views/screens/final_product_details_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListItemController>(builder: (controller) {
      return SafeArea(
        child: controller.isLoading
            ? customCircularProgressIndicator
            : controller.wishListItem.isEmpty
                ? Center(child: Lottie.asset(Urls.emptyWishListLottie))
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(top: 16.h),
                      itemBuilder: (context, index) {
                        final product = controller.wishListItem[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() =>
                                FinalProductDetailsScreen(product: product));
                          },
                          child: CustomCardStyle(
                            width: double.infinity.w,
                            height: 120.h,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Row(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: 120.w,
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${Urls.imgUrl}${product.images![0].path}'),
                                    ),
                                  ),
                                ),
                                Gap(50.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${product.name}',
                                          style: Get.textTheme.bodyLarge),
                                      Text(
                                        '${Urls.takaSign}${product.offerPrice}',
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
                                                  style:
                                                      Get.textTheme.bodyMedium),
                                              Gap(16.w),
                                              InkWell(
                                                onTap: () async {
                                                  controller.removeWishListItem(
                                                      product.id!);
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
                      itemCount: controller.wishListItem.length,
                    ),
                  ),
      );
    });
  }
}
