import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/controllers/my_order_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_outlined_button.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:darkak_e_commerce_app/screens/order_details_screen/order_details_screen.dart';
import 'package:darkak_e_commerce_app/screens/order_tracking_screen/order_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActiveOrders extends StatefulWidget {
  final MyOrderController controller;
  const ActiveOrders({super.key, required this.controller});

  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  @override
  Widget build(BuildContext context) {
    print(widget.controller.myOrderListData.length);
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final myOrder = widget.controller.myOrderListData[index];
            return CustomCard(
              width: double.infinity.w,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID: ${myOrder.orderId}',
                              style: Get.textTheme.bodyMedium,
                            ),
                            Gap(4.h),
                            Text(DateFormat('d MMMM, y').format(DateTime.now()),
                                style: Get.textTheme.bodySmall),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // Get.to(() => OrderDetailsScreen(
                            //     myOrder: myOrder, orderStatus: 'Active'));
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 25.sp,
                            color: orangeClr,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: orangeClr,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 77.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    '${AppUrls.imgUrl}${myOrder.cartItem!.productsData!.images![0].path}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Gap(16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${myOrder.cartItem!.productsData!.name}',
                                  style: Get.textTheme.bodyLarge),
                              SizedBox(
                                height: 20.h,
                                child: Row(
                                  children: [
                                    Text('Size: ${myOrder.cartItem!.size}',
                                        style: Get.textTheme.bodyMedium),
                                    VerticalDivider(
                                      color: blackClr,
                                      thickness: 2.w,
                                    ),
                                    Text(
                                        'Qty: ${myOrder.cartItem!.quantity.toString()}',
                                        style: Get.textTheme.bodyMedium),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${AppUrls.takaSign}${myOrder.cartItem!.productsData!.offerPrice}',
                                      style: Get.textTheme.bodyMedium!
                                          .copyWith(color: orangeClr)),
                                  CustomCard(
                                    width: 110.w,
                                    height: 35.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Row(
                                      children: [
                                        Text('Color:',
                                            style: Get.textTheme.bodyMedium),
                                        const Spacer(),
                                        Text('${myOrder.cartItem!.color}',
                                            style: Get.textTheme.titleSmall)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.w, right: 16.w, bottom: 16.h, top: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomOutlinedButton(
                            onPressed: () {
                              showDialogBox(
                                  title: 'Cancel',
                                  middleText: 'Are you sure want to cancel?',
                                  onPressedCancel: () {
                                    Get.back();
                                  },
                                  onPressedConfirm: () {
                                    Get.back();
                                  });
                            },
                            buttonName: 'Cancel',
                            buttonWidth: 150.w),
                        CustomOutlinedButton(
                            onPressed: () {
                              Get.to(() => OrderTrackingScreen(
                                  orderID: myOrder.orderId!));
                            },
                            buttonName: 'Track Order',
                            buttonWidth: 150.w),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(10.h),
          itemCount: widget.controller.myOrderListData.length),
    );
  }
}
