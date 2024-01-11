import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/screens/order_history_screen/my_order_screen/my_order_components/active_orders.dart';
import 'package:darkak_e_commerce_app/screens/order_history_screen/my_order_screen/my_order_components/cancelled_orders.dart';
import 'package:darkak_e_commerce_app/screens/order_history_screen/my_order_screen/my_order_components/completed_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

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
        backgroundColor: backgroundColor,
        appBar: AppbarTextviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          title: 'My Order',
          tabBar: TabBar(
            labelStyle: myTextStyle(20.sp, FontWeight.bold, textColor),
            unselectedLabelStyle: myTextStyle(
                20.sp, FontWeight.normal, textColor.withOpacity(0.5)),
            indicatorWeight: 6.h,
            indicatorColor: orangeColor,
            padding: EdgeInsets.symmetric(vertical: 0.h),
            dividerColor: orangeColor.withOpacity(0.5),
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
