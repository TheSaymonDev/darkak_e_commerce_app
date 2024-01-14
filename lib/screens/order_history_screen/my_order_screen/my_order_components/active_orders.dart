import 'package:darkak_e_commerce_app/models/my_order_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/utility.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style_2.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_outlined_button.dart';
import 'package:darkak_e_commerce_app/screens/order_history_screen/order_details_screen/order_details_page.dart';
import 'package:darkak_e_commerce_app/screens/order_tracking_screen/order_tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActiveOrders extends StatefulWidget {
  const ActiveOrders({
    super.key,
  });

  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final myOrder = MyOrder.activeOrders[index];
            return CustomCardStyle2(
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
                              'Order ID: ${myOrder.orderID}',
                              style: myTextStyle(
                                  20.sp, FontWeight.normal, textColor),
                            ),
                            Gap(4.h),
                            Text(
                              DateFormat('d MMMM, y').format(myOrder.date),
                              style: myTextStyle(
                                  15.sp, FontWeight.normal, textColor),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => OrderDetailsPage(
                                  orderID: myOrder.orderID,
                                  date: myOrder.date,
                                  products: myOrder.products,
                                  orderStatus: 'Active',
                                ));
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 25.sp,
                            color: orangeColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: orangeColor,
                  ),
                  Column(
                    children: List.generate(
                      myOrder.products.length,
                      (index) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 16.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80.h,
                                  width: 77.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: DecorationImage(
                                        image: AssetImage(myOrder
                                            .products[index].productImagePath),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Gap(16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        myOrder.products[index].productName,
                                        style: myTextStyle(25.sp,
                                            FontWeight.normal, textColor),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              'Size: ${myOrder.products[index].attributes[0]}',
                                              style: myTextStyle(20.sp,
                                                  FontWeight.normal, textColor),
                                            ),
                                            VerticalDivider(
                                              color: textColor,
                                              thickness: 2.w,
                                            ),
                                            Text(
                                              'Qty: ${myOrder.products[index].quantity.toString()}',
                                              style: myTextStyle(20.sp,
                                                  FontWeight.normal, textColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '$takaSign${myOrder.products[index].productPrice}',
                                            style: myTextStyle(20.sp,
                                                FontWeight.normal, orangeColor),
                                          ),
                                          CustomCardStyle2(
                                            width: 98.w,
                                            height: 35.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Color:',
                                                  style: myTextStyle(
                                                      15.sp,
                                                      FontWeight.normal,
                                                      textColor),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  myOrder
                                                      .products[index].color[0],
                                                  style: myTextStyle(
                                                      15.sp,
                                                      FontWeight.bold,
                                                      textColor),
                                                ),
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
                            Gap(8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomOutlinedButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: 'Cancel',
                                          titleStyle: myTextStyle(25.sp,
                                              FontWeight.bold, textColor),
                                          middleText:
                                              'Are you sure want to cancel?',
                                          middleTextStyle: myTextStyle(20.sp,
                                              FontWeight.normal, textColor),
                                          backgroundColor: backgroundColor,
                                          barrierDismissible: false,
                                          radius: 15.r,
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'No',
                                                  style: myTextStyle(
                                                      20.sp,
                                                      FontWeight.bold,
                                                      textColor),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    myOrder.products
                                                        .removeAt(index);
                                                    Get.back();
                                                  });
                                                },
                                                child: Text(
                                                  'Yes',
                                                  style: myTextStyle(
                                                      20.sp,
                                                      FontWeight.bold,
                                                      orangeColor),
                                                )),
                                          ]);
                                    },
                                    buttonName: 'Cancel',
                                    buttonWidth: 150.w),
                                CustomOutlinedButton(
                                    onPressed: () {
                                      Get.to(()=>OrderTrackingPage(orderID: myOrder.orderID));
                                    },
                                    buttonName: 'Track Order',
                                    buttonWidth: 150.w),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(10.h),
          itemCount: MyOrder.activeOrders.length),
    );
  }
}