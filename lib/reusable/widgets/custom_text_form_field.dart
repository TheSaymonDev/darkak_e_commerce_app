import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.suffixIcon,
      this.obscureText = false,
      this.readOnly = false,
      this.validator,
      this.keyBoardType,
      required this.labelText,
      required this.controller});

  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool obscureText, readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: double.infinity.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: myTextStyle(
                20.sp, FontWeight.normal, textColor.withOpacity(0.5)),
          ),
          Expanded(
            child: TextFormField(
              readOnly: readOnly,
              controller: controller,
              obscureText: obscureText,
              validator: validator,
              cursorColor: textColor,
              keyboardType: keyBoardType,
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
                suffixIcon: suffixIcon,
                fillColor: backgroundColor,
                filled: true,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: orangeColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: orangeColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
