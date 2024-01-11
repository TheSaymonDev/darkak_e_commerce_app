import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
    activeColor: const Color(0xffDDDDDD),
    selectedColor: orangeColor,
    inactiveColor: const Color(0xffDDDDDD),
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

SnackbarController customSnackMessage({required String title, required dynamic subTitle}) {
  return Get.snackbar(title, subTitle,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: orangeColor,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      duration: const Duration(seconds: 2),
      colorText: backgroundColor);
}


