import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomEditDeleteButtons extends StatelessWidget {
  const CustomEditDeleteButtons(
      {super.key, required this.isEditable, required this.onTap});

  final bool isEditable;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isEditable == true ? Icons.edit : Icons.delete_forever,
            size: 20.sp,
            color: orangeClr,
          ),
          Gap(4.w),
          Text(
            isEditable == true ? 'Edit' : 'Remove',
            style: myStyle(20.sp, FontWeight.bold, orangeClr),
          ),
        ],
      ),
    );
  }
}
