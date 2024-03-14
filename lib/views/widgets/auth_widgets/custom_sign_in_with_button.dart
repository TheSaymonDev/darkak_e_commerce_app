import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomSignInWithButton extends StatelessWidget {
  const CustomSignInWithButton(
      {super.key,
      required this.onPressed,
      required this.imgUrl,
      required this.name});

  final void Function()? onPressed;
  final String imgUrl, name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 344.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: whiteClr,
          shadowColor: whiteClr,
          foregroundColor: blackClr,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
              side: BorderSide(color: blackClr.withOpacity(0.1))),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              imgUrl,
              height: 20.h,
              width: 20.w,
              fit: BoxFit.cover,
            ),
            Gap(40.w),
            Text(
              name,
              style: Get.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
