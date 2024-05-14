import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
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
      child: CustomCard(
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
                    color: orangeClr.withOpacity(0.08)),
                child: Icon(
                  icon,
                  size: 20.sp,
                  color: orangeClr,
                ),
              ),
              Gap(16.w),
              Text(
                title,
                style: myStyle(25.sp, FontWeight.normal, blackClr),
              ),
              const Spacer(),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 25.sp,
                color: orangeClr,
              ),
            ],
          )),
    );
  }
}
