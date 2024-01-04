import 'package:darkak_e_commerce_app/data/various_sectors/best_selling.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_listview.dart';
import 'package:darkak_e_commerce_app/screens/payment_screen/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarTextviewWithBack(onPressedBack: (){Get.back();}, title: 'Summary',),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 198.h,
              width: double.infinity.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final productList = bestSellingProductList[index];
                    final discountAmount =
                        (productList.productPrice * productList.productDiscount) / 100;
                    final discountPrice =
                        productList.productPrice - discountAmount.toInt();
                    return Card(
                      color: backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Container(
                        height: double.infinity.h,
                        width: 125.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: backgroundColor),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                              },
                              child: Container(
                                height: 125.h,
                                width: 125.w,
                                alignment: Alignment.topRight,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: DecorationImage(
                                        image: AssetImage(productList.imgUrl),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productList.productName,
                                  style: myTextStyle(
                                      20.sp, FontWeight.normal, textColor),
                                ),
                                Text(
                                  '$takaSign${productList.productPrice}',
                                  style: myTextStyle(
                                      15.sp, FontWeight.normal, orangeColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      discountPrice.toString(),
                                      style: myTextStyle(
                                          15.sp, FontWeight.normal, greyColor,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                    Gap(10.w),
                                    Text(
                                      '-${productList.productDiscount.toString()}%',
                                      style: myTextStyle(
                                          15.sp, FontWeight.normal, greyColor),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.star,
                                      color: productList.productRating < 4.5
                                          ? greyColor
                                          : yellowColor,
                                      size: 15.sp,
                                    ),
                                    Text(
                                      productList.productRating.toString(),
                                      style: myTextStyle(
                                          15.sp, FontWeight.normal, textColor),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(0.w),
                  itemCount: bestSellingProductList.length),
            ),
            const Spacer(),
            Divider(color: orangeColor, thickness: 1.h,),
            Gap(8.h),
            SizedBox(height: 135.h, width: double.infinity.w, child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('Shipping Address', style: myTextStyle(25.sp, FontWeight.bold, textColor),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Dhaka, Dhaka North, Banani\nRoad No. 12 - 19', style: myTextStyle(20.sp, FontWeight.normal, textColor),),
                   Checkbox(value: true, onChanged: (value) {}, activeColor: orangeColor,),
                 ],
               ),
               GestureDetector(onTap:(){},child: Text('Change', style: myTextStyle(20.sp, FontWeight.bold, orangeColor))),
             ],
           ),),
            Gap(8.h),
            Divider(color: orangeColor,),
            Gap(8.h),
            SizedBox(height: 135.h, width: double.infinity.w, child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('Payment', style: myTextStyle(25.sp, FontWeight.bold, textColor),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(
                     height: 30.h,
                     width: 50.w,
                     child: Image.asset("assets/images/card-icon.png",),
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Master Card', style: myTextStyle(20.sp, FontWeight.normal, greyColor),),
                       Gap(8.h),
                       Text('**** **** **** 4543', style: myTextStyle(20.sp, FontWeight.bold, textColor),),
                     ],
                   ),
                   Checkbox(value: true, onChanged: (value) {}, activeColor: orangeColor,),
                 ],
               ),
               GestureDetector(
                   onTap: (){},
                   child: Text('Change', style: myTextStyle(20.sp, FontWeight.bold, orangeColor))),
             ],
           ),),
            Gap(8.h),
            Divider(color: orangeColor, thickness: 1.h,),
            const Spacer(),
            Row(
              children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 55.h,
                      width: 146.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: orangeColor, width: 2.w),
                          color: backgroundColor),
                      child: Text(
                        'Cancel',
                        style: myTextStyle(20.sp, FontWeight.bold, textColor),
                      ),
                    ),
                  ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(()=>const PaymentSuccessPage());
                  },
                  child: Container(
                    height: 55.h,
                    width: 146.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: orangeColor),
                    child: Text(
                     'Pay',
                      style:
                      myTextStyle(20.sp, FontWeight.bold, backgroundColor),
                    ),
                  ),
                ),
              ],
            ),
            Gap(40.h),
          ],
        ),
      ),
    );
  }
}
