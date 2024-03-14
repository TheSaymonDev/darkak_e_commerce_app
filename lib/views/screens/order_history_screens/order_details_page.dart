import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
import 'package:darkak_e_commerce_app/models/product_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/order_tracking_page.dart';
import 'package:darkak_e_commerce_app/views/screens/product_listing_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_my_order_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_product_item_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage(
      {super.key,
      required this.orderID,
      required this.date,
      required this.products,
      required this.orderStatus});

  final String orderID;
  final DateTime date;
  final List<ProductModel> products;
  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Order Details',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID: $orderID',
                style: myStyle(20.sp, FontWeight.normal, blackClr),
              ),
              CustomCardStyle(
                  width: double.infinity.w,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          height: 50.h,
                          width: double.infinity.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: orderStatus == 'Active'
                                ? Colors.yellow.shade100
                                : orderStatus == 'Completed'
                                    ? Colors.green.shade100
                                    : Colors.red.shade100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                orderStatus == 'Active'
                                    ? 'Order Received'
                                    : orderStatus == 'Completed'
                                        ? 'Order Delivered'
                                        : 'Order Cancelled',
                                style: myStyle(
                                    25.sp, FontWeight.normal, blackClr),
                              ),
                              Text(
                                DateFormat('d MMMM, y').format(date),
                                style: myStyle(
                                    15.sp, FontWeight.normal, blackClr),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: orangeClr,
                      ),
                      Column(
                        children: List.generate(
                          products.length,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 16.h),
                            child: Row(
                              children: [
                                Container(
                                  height: 80.h,
                                  width: 77.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            products[index].productImagePath),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Gap(16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[index].productName,
                                        style: myStyle(
                                            25.sp, FontWeight.normal, blackClr),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                        child: Row(
                                          children: [
                                            Text(
                                              'Size: ${products[index].attributes[0]}',
                                              style: myStyle(20.sp,
                                                  FontWeight.normal, blackClr),
                                            ),
                                            VerticalDivider(
                                              color: blackClr,
                                              thickness: 2.w,
                                            ),
                                            Text(
                                              'Qty: ${products[index].quantity.toString()}',
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
                                            '${Urls.takaSign}${products[index].productPrice}',
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
                                                  products[index].color[0],
                                                  style: myStyle(15.sp,
                                                      FontWeight.bold, blackClr),
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
                          ),
                        ),
                      )
                    ],
                  )),
              Gap(8.h),
              Visibility(
                visible: orderStatus == 'Active',
                child: Column(
                  children: [
                    CustomMyOrderButton(
                        onTap: () {
                          Get.to(()=> OrderTrackingScreen(orderID: orderID,));
                        },
                        icon: Icons.card_giftcard,
                        title: 'Track Order'),
                    Gap(8.h),
                    CustomMyOrderButton(
                        onTap: () {}, icon: Icons.cancel, title: 'Cancel Order'),
                  ],
                ),
              ),
              Visibility(
                visible: orderStatus == 'Completed',
                child: Column(
                  children: [
                    CustomMyOrderButton(
                        onTap: () {
                          Get.to(()=> OrderTrackingScreen(orderID: orderID,));
                        },
                        icon: Icons.card_giftcard,
                        title: 'Track Order'),
                    Gap(8.h),
                    CustomMyOrderButton(
                        onTap: () {},
                        icon: Icons.restart_alt,
                        title: 'Return Order'),
                  ],
                ),
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'You may like',
                    style: myStyle(25.sp, FontWeight.bold, blackClr),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>ProductListingScreen(productList: demoProductList));
                    },
                    child: Text(
                      'See all',
                      style: myStyle(20.sp, FontWeight.normal, blackClr),
                    ),
                  ),
                ],
              ),
              Gap(8.h),
              CustomProductItemGridView(productList: demoProductList, physics: const NeverScrollableScrollPhysics()),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
