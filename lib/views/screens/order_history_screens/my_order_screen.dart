import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/my_order_screen_widgets/active_orders.dart';
import 'package:darkak_e_commerce_app/views/widgets/my_order_screen_widgets/cancelled_orders.dart';
import 'package:darkak_e_commerce_app/views/widgets/my_order_screen_widgets/completed_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  // Helper function to filter orders based on status
  // List<MyOrder> getOrdersByStatus(String status) {
  //   return MyOrder.myOrders
  //       .where((order) => order.orderStatus == status)
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: whiteClr,
        appBar: AppbarTextviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          title: 'My Order',
          tabBar: TabBar(
            labelStyle: myStyle(20.sp, FontWeight.bold, blackClr),
            unselectedLabelStyle: myStyle(
                20.sp, FontWeight.normal, blackClr.withOpacity(0.5)),
            indicatorWeight: 6.h,
            indicatorColor: orangeClr,
            padding: EdgeInsets.symmetric(vertical: 0.h),
            dividerColor: orangeClr.withOpacity(0.5),
            dividerHeight: 2.h,
            tabs: const [
              Text('Active'),
              Text('Completed'),
              Text('Cancelled'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ActiveOrders(),
            CompletedOrders(),
            CancelledOrders(),
          ],
        ),
      ),
    );
  }
}
