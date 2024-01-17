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

SnackbarController customSnackMessage({required String title}) {
  return Get.snackbar(title, '',
      messageText: const SizedBox(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: orangeColor,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      borderRadius: 4.r,
      duration: const Duration(seconds: 2),
      colorText: backgroundColor);
}

Future<dynamic> showDialogBox({
  required String title,
  required String middleText,
  required void Function()? onPressedCancel,
  required void Function()? onPressedConfirm,
}) {
  return Get.defaultDialog(
    title: title,
    titleStyle: myTextStyle(25.sp, FontWeight.bold, textColor),
    middleText: middleText,
    middleTextStyle: myTextStyle(20.sp, FontWeight.normal, textColor),
    backgroundColor: backgroundColor,
    barrierDismissible: false,
    radius: 15.r,
    actions: [
      TextButton(
          onPressed: onPressedCancel,
          child: Text(
            'No',
            style: myTextStyle(20.sp, FontWeight.bold, textColor),
          )),
      TextButton(
          onPressed: onPressedConfirm,
          child: Text(
            'Yes',
            style: myTextStyle(20.sp, FontWeight.bold, orangeColor),
          )),
    ],
  );
}
