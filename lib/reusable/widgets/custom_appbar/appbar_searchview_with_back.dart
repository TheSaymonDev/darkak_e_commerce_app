import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarSearchviewWithBack extends StatelessWidget implements PreferredSizeWidget {

  const AppbarSearchviewWithBack({super.key, required this.onPressedBack, required this.onTapSearch});

  final void Function()? onPressedBack;
  final void Function()? onTapSearch;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: onPressedBack,
        icon: Icon(Icons.keyboard_arrow_left, size: 26.sp, color: orangeColor,),
      ),
      title: SizedBox(
        height: 50.h,
        width: double.infinity.w,
        child: TextField(
          onTap: onTapSearch,
          textAlign: TextAlign.start,
          cursorColor: textColor,
          style: myTextStyle(20.sp, FontWeight.normal, textColor),
          decoration: InputDecoration(
              fillColor: filledColor,
              filled: true,
              prefixIcon: Icon(Icons.search, size: 25.sp, color: orangeColor,),
              contentPadding: EdgeInsets.only(bottom: 10.h),
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
