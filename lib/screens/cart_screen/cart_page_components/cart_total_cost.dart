import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartTotalCost extends StatelessWidget {
  const CartTotalCost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: orangeColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 50.h,
            width: double.infinity.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sub Total',
                  style:
                  myTextStyle(20.sp, FontWeight.normal, textColor),
                ),
                Text(
                  '----------------------',
                  style: myTextStyle(
                      20.sp, FontWeight.normal, orangeColor),
                ),
                Text(
                  '${takaSign}3950',
                  style:
                  myTextStyle(20.sp, FontWeight.normal, textColor),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 50.h,
            width: double.infinity.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Delivery charge',
                  style:
                  myTextStyle(20.sp, FontWeight.normal, textColor),
                ),
                Text(
                  '----------------------',
                  style: myTextStyle(
                      20.sp, FontWeight.normal, orangeColor),
                ),
                Text(
                  '${takaSign}50',
                  style:
                  myTextStyle(20.sp, FontWeight.normal, textColor),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: orangeColor,
        ),
        Gap(16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 50.h,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: orangeColor,
                    style:
                    myTextStyle(20.sp, FontWeight.normal, textColor),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), bottomLeft: Radius.circular(4.r)),
                        borderSide: BorderSide(color: orangeColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                        borderSide: BorderSide(color: orangeColor, width: 1),
                      ),
                      hintText: 'Enter Voucher Code',
                      hintStyle: myTextStyle(
                          20.sp, FontWeight.normal, greyColor),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity.h,
                  width: 110.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                      border: Border.all(color: orangeColor, width: 1.w)),
                  child: Text(
                    'APPLY',
                    style: myTextStyle(20.sp, FontWeight.bold, textColor),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}