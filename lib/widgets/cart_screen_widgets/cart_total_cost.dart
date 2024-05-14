
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
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
          color: orangeClr,
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
                  myStyle(20.sp, FontWeight.normal, blackClr),
                ),
                Text(
                  '----------------------',
                  style: myStyle(
                      20.sp, FontWeight.normal, orangeClr),
                ),
                Text(
                  '${AppUrls.takaSign}3950',
                  style:
                  myStyle(20.sp, FontWeight.normal, blackClr),
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
                  myStyle(20.sp, FontWeight.normal, blackClr),
                ),
                Text(
                  '----------------------',
                  style: myStyle(
                      20.sp, FontWeight.normal, orangeClr),
                ),
                Text(
                  '${AppUrls.takaSign}50',
                  style:
                  myStyle(20.sp, FontWeight.normal, blackClr),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: orangeClr,
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
                    cursorColor: orangeClr,
                    style:
                    myStyle(20.sp, FontWeight.normal, blackClr),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), bottomLeft: Radius.circular(4.r)),
                        borderSide: BorderSide(color: orangeClr, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                        borderSide: BorderSide(color: orangeClr, width: 1),
                      ),
                      hintText: 'Enter Voucher Code',
                      hintStyle: myStyle(
                          20.sp, FontWeight.normal, greyClr),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity.h,
                  width: 110.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                      border: Border.all(color: orangeClr, width: 1.w)),
                  child: Text(
                    'APPLY',
                    style: myStyle(20.sp, FontWeight.bold, blackClr),
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