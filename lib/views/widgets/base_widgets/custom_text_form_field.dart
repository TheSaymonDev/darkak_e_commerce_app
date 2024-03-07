import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Get.textTheme.bodyMedium!.copyWith(color: greyClr)),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          cursorColor: blackClr,
          keyboardType: keyBoardType,
          style: Get.textTheme.bodyMedium,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
            suffixIcon: suffixIcon,
            fillColor: Colors.grey.shade100,
            filled: true,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: orangeClr),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: orangeClr),
            ),
          ),
        ),
      ],
    );
  }
}
