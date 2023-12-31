import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextStyle myTextStyle(double fSize, FontWeight fWeight, Color clr, {TextDecoration? decoration}) {
  return TextStyle(
    fontSize: fSize,
    fontWeight: fWeight,
    color: clr,
    fontFamily: 'Gumela Arabic',
    height: 1,
    decoration: decoration,
  );
}

BoxDecoration shadowDecoration() {
  return BoxDecoration(boxShadow: [
    BoxShadow(
      color: greyColor.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(0, 1),
    ),
  ], shape: BoxShape.circle, color: backgroundColor);
}

BoxDecoration shadowDecoration1() {
  return BoxDecoration(boxShadow: [
    BoxShadow(
      color: greyColor.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(0, 1),
    ),
  ], borderRadius: BorderRadius.circular(50.r), color: backgroundColor);
}

myToastMessage({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: orangeColor,
      textColor: backgroundColor,
      fontSize: 16);
}

PinTheme pinTheme() {
  return PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(4.r),
    borderWidth: 1.w,
    inactiveFillColor: backgroundColor,
    selectedFillColor: backgroundColor,
    fieldHeight: 46.h,
    fieldWidth: 46.w,
    activeColor: Color(0xffDDDDDD),
    selectedColor: orangeColor,
    inactiveColor: Color(0xffDDDDDD),
  );
}

DropdownButton<String> customDropDownButton(
    {required void Function(String?)? onChanged,
    required List<DropdownMenuItem<String>>? items}) {
  return DropdownButton(
    icon: Icon(
      Icons.keyboard_arrow_down,
      color: orangeColor,
    ),
    iconSize: 30.sp,
    elevation: 4,
    underline: const SizedBox(
      height: 0,
    ),
    items: items,
    onChanged: onChanged,
  );
}

BoxDecoration decorationStyle() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
    color: filledColor,
  );
}

const String takaSign = '৳';

