import 'package:e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AppFlutterSwitch extends StatelessWidget {
  const AppFlutterSwitch({super.key, required this.onToggle, required this.value});

   final void Function(bool) onToggle;
   final bool value;

  @override
  Widget build(BuildContext context) {
    return   FlutterSwitch(
      activeColor: orangeColor,
      inactiveColor: Colors.grey,
      width: 44.0.w,
      height: 23.0.h,
      toggleSize: 18.0.sp,
      borderRadius: 30.0.r,
      padding: 4.0.w,
      value: value,
      onToggle: onToggle,
    );
  }
}
