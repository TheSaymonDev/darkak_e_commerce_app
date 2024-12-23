import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:darkak_e_commerce_app/screens/order_details_screen/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CancelledOrders extends StatelessWidget {
  const CancelledOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      // child: ListView.separated(
      //     itemBuilder: (context, index) {
      //       final myOrder = MyOrder.cancelledOrders[index];
      //       return CustomCard(
      //         width: double.infinity.w,
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding:
      //                   EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         'Order ID: ${myOrder.orderID}',
      //                         style: myStyle(
      //                             20.sp, FontWeight.normal, blackClr),
      //                       ),
      //                       Gap(4.h),
      //                       Text(
      //                         myOrder.date.toString(),
      //                         style: myStyle(
      //                             15.sp, FontWeight.normal, blackClr),
      //                       ),
      //                     ],
      //                   ),
      //                   IconButton(
      //                     onPressed: () {
      //                       // Get.to(() => OrderDetailsPage(
      //                       //     orderID: myOrder.orderID,
      //                       //     date: myOrder.date,
      //                       //     products: myOrder.products,
      //                       //     orderStatus: 'Cancelled'));
      //                     },
      //                     icon: Icon(
      //                       Icons.keyboard_arrow_right_outlined,
      //                       size: 25.sp,
      //                       color: orangeClr,
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             const Divider(
      //               color: orangeClr,
      //             ),
      //             Column(
      //               children: List.generate(
      //                 myOrder.productsData.length,
      //                 (index) => Container(
      //                   padding: EdgeInsets.symmetric(
      //                       horizontal: 8.w, vertical: 16.h),
      //                   child: Column(
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Container(
      //                             height: 80.h,
      //                             width: 77.w,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(4.r),
      //                               image: DecorationImage(
      //                                   image: AssetImage(myOrder
      //                                       .productsData[index].productImagePath),
      //                                   fit: BoxFit.cover),
      //                             ),
      //                           ),
      //                           Gap(16.w),
      //                           Expanded(
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   myOrder.productsData[index].productName,
      //                                   style: myStyle(25.sp,
      //                                       FontWeight.normal, blackClr),
      //                                 ),
      //                                 SizedBox(
      //                                   height: 20.h,
      //                                   child: Row(
      //                                     children: [
      //                                       Text(
      //                                         'Size: ${myOrder.productsData[index].attributes[0]}',
      //                                         style: myStyle(20.sp,
      //                                             FontWeight.normal, blackClr),
      //                                       ),
      //                                       VerticalDivider(
      //                                         color: blackClr,
      //                                         thickness: 2.w,
      //                                       ),
      //                                       Text(
      //                                         'Qty: ${myOrder.productsData[index].quantity.toString()}',
      //                                         style: myStyle(20.sp,
      //                                             FontWeight.normal, blackClr),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                                 Row(
      //                                   mainAxisAlignment:
      //                                       MainAxisAlignment.spaceBetween,
      //                                   children: [
      //                                     Text(
      //                                       '${AppUrls.takaSign}${myOrder.productsData[index].productPrice}',
      //                                       style: myStyle(20.sp,
      //                                           FontWeight.normal, orangeClr),
      //                                     ),
      //                                     CustomCard(
      //                                       width: 98.w,
      //                                       height: 35.h,
      //                                       padding: EdgeInsets.symmetric(
      //                                           horizontal: 8.w),
      //                                       child: Row(
      //                                         children: [
      //                                           Text(
      //                                             'Color:',
      //                                             style: myStyle(
      //                                                 15.sp,
      //                                                 FontWeight.normal,
      //                                                 blackClr),
      //                                           ),
      //                                           const Spacer(),
      //                                           Text(
      //                                             myOrder
      //                                                 .productsData[index].color[0],
      //                                             style: myStyle(
      //                                                 15.sp,
      //                                                 FontWeight.bold,
      //                                                 blackClr),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     )
      //                                   ],
      //                                 )
      //                               ],
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //     separatorBuilder: (context, index) => Gap(10.h),
      //     itemCount: MyOrder.cancelledOrders.length),
    );
  }
}
