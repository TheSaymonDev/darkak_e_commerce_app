import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: const Color(0xffF9F9F9)),
      child: Row(
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffBC291D),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                    text: '10',
                    style: myTextStyle(45.sp, FontWeight.normal, backgroundColor),
                    children: [
                      TextSpan(
                          text: '%',
                          style: myTextStyle(20.sp, FontWeight.normal, backgroundColor)
                      )
                    ]
                )),
                Text('Off', style: myTextStyle(20.sp, FontWeight.normal, backgroundColor),)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Summer Sale', style: myTextStyle(25.sp, FontWeight.normal, textColor),),
                      Text('Summer24', style: myTextStyle(20.sp, FontWeight.normal, textColor),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('6 days remaining', style: myTextStyle(15.sp, FontWeight.normal, greyColor),),
                      Gap(8.h),
                      GestureDetector(
                        onTap: (){
                          Clipboard.setData(const ClipboardData(text: 'Summer24'));
                          customSnackMessage(title: 'Promotional Code Copied');
                        },
                        child: Container(
                          height: 33.h,
                          width: 88.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: orangeColor
                          ),
                          child: Text('Get', style: myTextStyle(20.sp, FontWeight.bold, backgroundColor),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}