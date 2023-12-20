import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchTextFormField extends StatelessWidget {
  const AppSearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 328.w,
      child: TextField(
        onTap: (){},
        textAlign: TextAlign.start,
        cursorColor: textColor,
        style: myTextStyle(20.sp, FontWeight.normal, textColor),
        decoration: InputDecoration(
            fillColor: filledColor,
            filled: true,
            prefixIcon: Icon(Icons.search, size: 25.sp, color: orangeColor,),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.r)
            )
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
