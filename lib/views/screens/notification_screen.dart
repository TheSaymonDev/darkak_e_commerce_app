import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {},
        title: 'Notification',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TODAY',
                style: myStyle(25.sp, FontWeight.normal, blackClr),
              ),
              Gap(8.h),
              Flexible(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 130.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                        child: Row(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: filledClr),
                              child: Icon(
                                Icons.local_shipping_outlined,
                                color: orangeClr,
                                size: 30.sp,
                              ),
                            ),
                            Gap(8.w),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Order Shipped',
                                        style: myStyle(
                                            25.sp, FontWeight.normal, blackClr),
                                      ),
                                      Text(
                                        '1h',
                                        style: myStyle(
                                            25.sp, FontWeight.normal, blackClr),
                                      ),
                                    ],
                                  ),
                                  Gap(4.h),
                                  Text(
                                    'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.',
                                    style: myStyle(
                                        20.sp, FontWeight.normal, blackClr),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Gap(16.h),
                    itemCount: 3),
              ),
              Gap(8.h),
              Text(
                'YESTERDAY',
                style: myStyle(25.sp, FontWeight.normal, blackClr),
              ),
              Gap(8.h),
              Flexible(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 130.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                        child: Row(
                          children: [
                            Container(
                              height: 75.h,
                              width: 75.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: filledClr),
                              child: Icon(
                                Icons.local_shipping_outlined,
                                color: orangeClr,
                                size: 30.sp,
                              ),
                            ),
                            Gap(8.w),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Order Shipped',
                                        style: myStyle(
                                            25.sp, FontWeight.normal, blackClr),
                                      ),
                                      Text(
                                        '1h',
                                        style: myStyle(
                                            25.sp, FontWeight.normal, blackClr),
                                      ),
                                    ],
                                  ),
                                  Gap(4.h),
                                  Text(
                                    'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.',
                                    style: myStyle(
                                        20.sp, FontWeight.normal, blackClr),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Gap(16.h),
                    itemCount: 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
