import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/create_order_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/order_package_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_address_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class StepSummaryWidget extends StatelessWidget {

  StepSummaryWidget(
      {super.key});

  final _createOrderController = Get.find<CreateOrderController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = _createOrderController.cartItemList[index];
                return SizedBox(
                  width: double.infinity,
                  height: 100.h,
                  child: Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: double.infinity.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    '${AppUrls.imgUrl}${item.productsData!.images![0].path}'),
                                fit: BoxFit.cover)),
                      ),
                      Gap(36.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.productsData!.name}',
                              style: Get.textTheme.bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                    '${AppUrls.takaSign}${item.productsData!.offerPrice}',
                                    style: Get.textTheme.bodyMedium!
                                        .copyWith(color: orangeClr)),
                                Gap(48.w),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: yellowClr,
                                      size: 20.sp,
                                    ),
                                    Text('4.5', style: Get.textTheme.bodyMedium)
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Size: ${item.size}',
                                  style: Get.textTheme.bodyMedium,
                                ),
                                Gap(48.w),
                                Text('Quantity: ${item.quantity.toString()}',
                                    style: Get.textTheme.bodyMedium)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Gap(16.h),
              itemCount: _createOrderController.cartItemList.length),
        ),
        Divider(
          color: orangeClr.withValues(alpha: 0.3),
          thickness: 1.h,
        ),
        Text(
          'Shipping Address',
          style: Get.textTheme.titleLarge,
        ),
        Gap(16.h),
        GetBuilder<StepAddressController>(builder: (controller) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.readAddress!.fullName ?? '',
                      style: Get.textTheme.titleMedium),
                  Text(controller.readAddress!.mobile ?? '',
                      style:
                      Get.textTheme.titleMedium!.copyWith(color: greyClr))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                          '${controller.readAddress!.address ?? ''}, ${controller.readAddress!.area ?? ''}, ${controller.readAddress!.zip ?? ''}\n${controller.readAddress!.thana ?? ''}, ${controller.readAddress!.city ?? ''}, ${controller.readAddress!.state ?? ''}',
                          style: Get.textTheme.bodyMedium)),
                  Checkbox(
                    value: true,
                    onChanged: (newValue) {},
                    activeColor: orangeClr,
                    shape: const CircleBorder(),
                  )
                ],
              ),
            ],
          );
        }),
        Divider(
          color: orangeClr.withValues(alpha: 0.3),
          thickness: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Delivery charge', style: Get.textTheme.bodyMedium),
            Text('----------------------',
                style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)),
            Text('${AppUrls.takaSign}${Get.find<OrderPackageController>().deliveryCharge.toString()}', style: Get.textTheme.bodyMedium)
          ],
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Total Amount', style: Get.textTheme.bodyMedium),
            Text('----------------------',
                style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)),
            Text('${AppUrls.takaSign}${_createOrderController.totalAmount.toString()}',
                style: Get.textTheme.bodyMedium)
          ],
        ),
        Divider(
          color: orangeClr.withValues(alpha: 0.3),
          thickness: 1.h,
        ),
      ],
    );
  }
}