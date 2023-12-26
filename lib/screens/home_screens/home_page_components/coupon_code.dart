import 'package:e_commerce_app/models/coupon_code_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.h,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            height: double.infinity,
            width: 180.w,
            padding: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: orangeColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    CouponCodeModel
                        .couponCodeList[index].couponCode,
                    style: myTextStyle(25.sp,
                        FontWeight.normal, backgroundColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'Get${CouponCodeModel.couponCodeList[index].discount}% Off',
                    style: myTextStyle(15.sp,
                        FontWeight.normal, backgroundColor),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    String copiedCode = CouponCodeModel
                        .couponCodeList[index].couponCode;
                    Clipboard.setData(
                        ClipboardData(text: copiedCode));
                    GetStorage()
                        .write('copyCode', 'Copied');
                    final code =
                    GetStorage().read('copyCode');
                    Get.snackbar('Coupon Code', code,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: orangeColor,
                        colorText: backgroundColor);
                  },
                  child: Container(
                    height: 25.h,
                    width: double.infinity.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight:
                          Radius.circular(20.r)),
                      color:
                      backgroundColor.withOpacity(0.8),
                    ),
                    child: Text(
                      'Copy Code',
                      style: myTextStyle(15.sp,
                          FontWeight.normal, textColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => Gap(38.w),
          itemCount: CouponCodeModel.couponCodeList.length),
    );
  }
}