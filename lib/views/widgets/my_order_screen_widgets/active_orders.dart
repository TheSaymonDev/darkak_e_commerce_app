
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/my_order_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/order_history_screens/order_details_page.dart';
import 'package:darkak_e_commerce_app/views/screens/order_tracking_page.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_outlined_button.dart';
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
            return CustomCardStyle(
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
                              style: myStyle(
                                  20.sp, FontWeight.normal, blackClr),
                            ),
                            Gap(4.h),
                            Text(
                              DateFormat('d MMMM, y').format(myOrder.date),
                              style: myStyle(
                                  15.sp, FontWeight.normal, blackClr),
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
                            color: orangeClr,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: orangeClr,
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
                                        style: myStyle(25.sp,
                                            FontWeight.normal, blackClr),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              'Size: ${myOrder.products[index].attributes[0]}',
                                              style: myStyle(20.sp,
                                                  FontWeight.normal, blackClr),
                                            ),
                                            VerticalDivider(
                                              color: blackClr,
                                              thickness: 2.w,
                                            ),
                                            Text(
                                              'Qty: ${myOrder.products[index].quantity.toString()}',
                                              style: myStyle(20.sp,
                                                  FontWeight.normal, blackClr),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${Urls.takaSign}${myOrder.products[index].productPrice}',
                                            style: myStyle(20.sp,
                                                FontWeight.normal, orangeClr),
                                          ),
                                          CustomCardStyle(
                                            width: 98.w,
                                            height: 35.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Color:',
                                                  style: myStyle(
                                                      15.sp,
                                                      FontWeight.normal,
                                                      blackClr),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  myOrder
                                                      .products[index].color[0],
                                                  style: myStyle(
                                                      15.sp,
                                                      FontWeight.bold,
                                                      blackClr),
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
                                      showDialogBox(
                                          title: 'Cancel',
                                          middleText:
                                              'Are you sure want to cancel?',
                                          onPressedCancel: () {
                                            Get.back();
                                          },
                                          onPressedConfirm: () {
                                            setState(() {
                                              myOrder.products.removeAt(index);
                                              Get.back();
                                            });
                                          });
                                    },
                                    buttonName: 'Cancel',
                                    buttonWidth: 150.w),
                                CustomOutlinedButton(
                                    onPressed: () {
                                      Get.to(() => OrderTrackingScreen(
                                          orderID: myOrder.orderID));
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
