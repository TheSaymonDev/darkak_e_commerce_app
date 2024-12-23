import 'package:darkak_e_commerce_app/screens/my_order_screen/controllers/my_order_controller.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/widgets/active_orders.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/widgets/cancelled_orders.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/widgets/completed_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  // Helper function to filter orders based on status
  // List<MyOrder> getOrdersByStatus(String status) {
  //   return MyOrder.myOrders
  //       .where((order) => order.orderStatus == status)
  //       .toList();
  // }

  final  _myOrderController = Get.put(MyOrderController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myOrderController.getMyOrderList();
  }

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
            labelStyle: Get.textTheme.titleMedium,
            unselectedLabelStyle:
                Get.textTheme.bodyMedium!.copyWith(color: greyClr),
            indicatorWeight: 6.h,
            indicatorColor: orangeClr,
            padding: EdgeInsets.symmetric(vertical: 0.h),
            dividerColor: orangeClr.withValues(alpha: 0.5),
            dividerHeight: 2.h,
            tabs: const [
              Text('Active'),
              Text('Completed'),
              Text('Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GetBuilder<MyOrderController>(
                builder: (controller) => controller.isLoading
                    ? customCircularProgressIndicator
                    : controller.myOrderListData.isEmpty
                        ? Center(
                            child: Text('No Order',
                                style: Get.textTheme.titleMedium))
                        : ActiveOrders(controller: controller)),
            CompletedOrders(),
            CancelledOrders(),
          ],
        ),
      ),
    );
  }
}
