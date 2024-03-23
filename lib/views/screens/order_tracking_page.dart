import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/order_tracking_screen_widgets/my_time_line_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key, required this.orderID});

  final String orderID;

  @override
  Widget build(BuildContext context) {
    final title = 'Order ID: $orderID';
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: title,
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: const [
            MyTimeLineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              title: 'Order Placed',
              address: 'Banani, Dhaka',
              year: '20/24',
              time: '10:00',
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              title: 'Order Confirmed',
              address: 'Banani, Dhaka',
              year: '21/24',
              time: '11:00',
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              title: 'Order Processed',
              address: 'Banani, Dhaka',
              year: '22/24',
              time: '12:00',
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: false,
              isPast: false,
              title: 'Order Shipped',
              address: 'Banani, Dhaka',
              year: '23/24',
              time: '01:00',
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              title: 'Order Delivered',
              address: 'Banani, Dhaka',
              year: '24/24',
              time: '02:00',
            ),
          ],
        ),
      ),
    );
  }
}
