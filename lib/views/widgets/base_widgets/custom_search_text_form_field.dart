
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({super.key, this.onTap, this.readOnly=false,});

  final void Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity.w,
      child: TextField(
        onTap: onTap,
        textAlign: TextAlign.start,
        cursorColor: blackClr,
        readOnly: readOnly,
        style: myStyle(20.sp, FontWeight.normal, blackClr),
        decoration: InputDecoration(
            fillColor: filledClr,
            filled: true,
            prefixIcon: Icon(Icons.search, size: 25.sp, color: orangeClr,),
            contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.r)
            )
        ),

      ),
    );
  }
}
