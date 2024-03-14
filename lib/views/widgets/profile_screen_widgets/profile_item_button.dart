import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileItemButton extends StatelessWidget {
  final String iconUrl;
  final String title;
  final Widget? widget;

  const ProfileItemButton({
    super.key,
    required this.iconUrl,
    required this.title,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SvgPicture.asset(
            iconUrl,
            fit: BoxFit.cover,
            height: 40.h,
            width: 40.w,
          ),
          Gap(30.w),
          Text(
            title,
            style: Get.textTheme.bodyMedium,
          ),
          const Spacer(),
          widget ?? Icon(
            Icons.keyboard_arrow_right,
            color: orangeClr,
            size: 27.sp,
          )
        ],
      ),
    );
  }
}
