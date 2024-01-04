import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 213.h,
              width: 208.w,
              child: SvgPicture.asset('assets/images/payment-success.svg', fit: BoxFit.cover,),
            ),
            Gap(48.h),
            Text('Success!', style: myTextStyle(60.sp, FontWeight.bold, orangeColor),),
            Gap(30.h),
            Text('Your order will be delivered soon. Thank you for choosing our app!', style: myTextStyle(25.sp, FontWeight.bold, textColor),textAlign: TextAlign.center,),
            const Spacer(),
            CustomOrangeButton(onPressed: (){
              Get.offAll(()=>const BottomNavBarPage());
            }, buttonName: 'Continue Shopping', width: double.infinity.w),
            Gap(40.h),
          ],
        ),
      )),
    );
  }
}
