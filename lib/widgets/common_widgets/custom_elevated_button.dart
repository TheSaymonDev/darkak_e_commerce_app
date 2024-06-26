import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
    required this.width,
  });

  final String buttonName;
  final void Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: orangeClr,
          foregroundColor: whiteClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: whiteClr),
        ),
      ),
    );
  }
}
