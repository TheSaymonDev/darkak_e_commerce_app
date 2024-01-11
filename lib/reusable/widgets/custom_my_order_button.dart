import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomMyOrderButton extends StatelessWidget {
  const CustomMyOrderButton({super.key, required this.onTap, required this.icon, required this.title});

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCardStyle2(
          width: double.infinity.w,
          height: 58.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: orangeColor.withOpacity(0.08)),
                child: Icon(
                  icon,
                  size: 20.sp,
                  color: orangeColor,
                ),
              ),
              Gap(16.w),
              Text(
                title,
                style: myTextStyle(25.sp, FontWeight.normal, textColor),
              ),
              const Spacer(),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 25.sp,
                color: orangeColor,
              ),
            ],
          )),
    );
  }
}
