import 'package:e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextStyle myTextStyle(double fSize, FontWeight fWeight, Color clr) {
  return TextStyle(
      fontSize: fSize,
      fontWeight: fWeight,
      color: clr,
      fontFamily: 'Gumela Arabic',
      height: 1
  );
}

myToastMessage({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: greenClr,
      textColor: backgroundClr,
      fontSize: 16);
}

PinTheme pinTheme() {
  return PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(4.r),
    borderWidth: 1.w,
    inactiveFillColor: backgroundClr,
    selectedFillColor: backgroundClr,
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
      color: greenClr,
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
    color: filledClr,
  );
}
