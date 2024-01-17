import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarSearchviewWithBack extends StatelessWidget implements PreferredSizeWidget {

  const AppbarSearchviewWithBack({super.key, required this.onPressedBack, this.onChanged, this.onTap});

  final void Function()? onPressedBack;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      shadowColor: greyColor.withOpacity(0.3),
      leading: IconButton(
        onPressed: onPressedBack,
        icon: Icon(Icons.keyboard_arrow_left, size: 26.sp, color: orangeColor,),
      ),
      title: SizedBox(
        height: 40.h,
        width: double.infinity.w,
        child: TextField(
          onTap: onTap,
          onChanged: onChanged,
          textAlign: TextAlign.start,
          cursorColor: textColor,
          style: myTextStyle(20.sp, FontWeight.normal, textColor),
          decoration: InputDecoration(
              fillColor: filledColor,
              filled: true,
              prefixIcon: Icon(Icons.search, size: 25.sp, color: orangeColor,),
              contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.r)
              )
          ),

        ),
      ),
    );
  }
}
