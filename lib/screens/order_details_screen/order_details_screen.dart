// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:darkak_e_commerce_app/utils/app_colors.dart';
// import 'package:darkak_e_commerce_app/utils/app_urls.dart';
// import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
// import 'package:darkak_e_commerce_app/screens/my_order_screen/model/my_order_model.dart';
// import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
// import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
// import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_my_order_button.dart';
// import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_item_gridview.dart';
// import 'package:darkak_e_commerce_app/widgets/styles.dart';
// import 'package:darkak_e_commerce_app/screens/order_tracking_screen/order_tracking_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class OrderDetailsScreen extends StatelessWidget {
//   const OrderDetailsScreen({
//     super.key,
//     required this.myOrder,
//     required this.orderStatus,
//   });
//
//   final MyOrder myOrder;
//   final String orderStatus;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteClr,
//       appBar: AppbarTextviewWithBack(
//         onPressedBack: () {
//           Get.back();
//         },
//         title: 'Order Details',
//       ),
//       body: Container(
//         height: double.infinity.h,
//         width: double.infinity.w,
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Order ID: ${myOrder.orderId}',
//                 style: Get.textTheme.bodyMedium
//               ),
//               CustomCard(
//                   width: double.infinity.w,
//                   padding: EdgeInsets.symmetric(vertical: 8.h),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.w),
//                         child: Container(
//                           height: 50.h,
//                           width: double.infinity.w,
//                           padding: EdgeInsets.symmetric(horizontal: 8.w),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.r),
//                             color: orderStatus == 'Active'
//                                 ? Colors.yellow.shade100
//                                 : orderStatus == 'Completed'
//                                     ? Colors.green.shade100
//                                     : Colors.red.shade100,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 orderStatus == 'Active'
//                                     ? 'Order Received'
//                                     : orderStatus == 'Completed'
//                                         ? 'Order Delivered'
//                                         : 'Order Cancelled',
//                                 style:
//                                     myStyle(25.sp, FontWeight.normal, blackClr),
//                               ),
//                               Text(
//                                 DateFormat('d MMMM, y').format(DateTime.now()),
//                                 style:
//                                     myStyle(15.sp, FontWeight.normal, blackClr),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const Divider(
//                         color: orangeClr,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 8.w, vertical: 16.h),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 80.h,
//                               width: 77.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4.r),
//                                 image: DecorationImage(
//                                     image: CachedNetworkImageProvider('${AppUrls.imgUrl}${myOrder.cartItem!.productsData!.images![0].path}'),
//                                     fit: BoxFit.cover),
//                               ),
//                             ),
//                             Gap(16.w),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                       '${myOrder.cartItem!.productsData!.name}',
//                                       style: Get.textTheme.bodyLarge
//                                   ),
//                                   SizedBox(
//                                     height: 20.h,
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                             'Size: ${myOrder.cartItem!.size}',
//                                             style: Get.textTheme.bodyMedium
//                                         ),
//                                         VerticalDivider(
//                                           color: blackClr,
//                                           thickness: 2.w,
//                                         ),
//                                         Text(
//                                             'Qty: ${myOrder.cartItem!.quantity.toString()}',
//                                             style: Get.textTheme.bodyMedium
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                           '${AppUrls.takaSign}${myOrder.cartItem!.productsData!.offerPrice}',
//                                           style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)
//                                       ),
//                                       CustomCard(
//                                         width: 110.w,
//                                         height: 35.h,
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 8.w),
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                                 'Color:',
//                                                 style: Get.textTheme.bodySmall
//                                             ),
//                                             const Spacer(),
//                                             Text(
//                                                 '${myOrder.cartItem!.color}',
//                                                 style: Get.textTheme.titleSmall
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   )),
//               Gap(8.h),
//               Visibility(
//                 visible: orderStatus == 'Active',
//                 child: Column(
//                   children: [
//                     CustomMyOrderButton(
//                         onTap: () {
//                           Get.to(() => OrderTrackingScreen(
//                                 orderID: myOrder.orderId!,
//                               ));
//                         },
//                         icon: Icons.card_giftcard,
//                         title: 'Track Order'),
//                     Gap(8.h),
//                     CustomMyOrderButton(
//                         onTap: () {},
//                         icon: Icons.cancel,
//                         title: 'Cancel Order'),
//                   ],
//                 ),
//               ),
//               Visibility(
//                 visible: orderStatus == 'Completed',
//                 child: Column(
//                   children: [
//                     CustomMyOrderButton(
//                         onTap: () {
//                           Get.to(() => OrderTrackingScreen(
//                                 orderID: myOrder.orderId!,
//                               ));
//                         },
//                         icon: Icons.card_giftcard,
//                         title: 'Track Order'),
//                     Gap(8.h),
//                     CustomMyOrderButton(
//                         onTap: () {},
//                         icon: Icons.restart_alt,
//                         title: 'Return Order'),
//                   ],
//                 ),
//               ),
//               Gap(16.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'You may like',
//                     style: myStyle(25.sp, FontWeight.bold, blackClr),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Get.to(()=>ProductListingScreen(productList: demoProductList));
//                     },
//                     child: Text(
//                       'See all',
//                       style: myStyle(20.sp, FontWeight.normal, blackClr),
//                     ),
//                   ),
//                 ],
//               ),
//               Gap(8.h),
//               CustomProductItemGridView(
//                   productList: demoProductList,
//                   physics: const NeverScrollableScrollPhysics()),
//               Gap(16.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
