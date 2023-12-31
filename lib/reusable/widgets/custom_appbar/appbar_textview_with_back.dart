import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarTextviewWithBack extends StatelessWidget implements PreferredSizeWidget {

  const AppbarTextviewWithBack({super.key, required this.onPressedBack, this.title});

  final void Function()? onPressedBack;
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: onPressedBack,
        icon: Icon(Icons.keyboard_arrow_left, size: 26.sp, color: orangeColor,),
      ),
      title: title != null
          ? Text(title!, style: myTextStyle(20.sp, FontWeight.bold, textColor))
          : null, // Use null if title is not provided
    );
  }
}
