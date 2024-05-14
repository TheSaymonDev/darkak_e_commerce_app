import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.onPressed, required this.buttonName, required this.buttonWidth});

  final String buttonName;
  final void Function()? onPressed;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: buttonWidth,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: whiteClr,
          foregroundColor: orangeClr,
          side: BorderSide(width: 1.w, color: orangeClr),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r))
        ),
        child: Text(
          buttonName,
          style: myStyle(15.sp, FontWeight.bold, blackClr),
        ),
      ),
    );
  }
}
