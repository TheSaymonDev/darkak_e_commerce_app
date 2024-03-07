import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextStyle myStyle(double fSize, FontWeight fWeight, Color clr, {TextDecoration? decoration}) {
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
      backgroundColor: orangeClr,
      textColor: whiteClr,
      fontSize: 16);
}

PinTheme pinTheme() {
  return PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(4.r),
    borderWidth: 1.w,
    inactiveFillColor: whiteClr,
    selectedFillColor: whiteClr,
    fieldHeight: 50.h,
    fieldWidth: 46.w,
    activeColor: const Color(0xffDDDDDD),
    selectedColor: orangeClr,
    inactiveColor: const Color(0xffDDDDDD),
  );
}

SnackbarController customSnackMessage({required String title}) {
  return Get.snackbar(title, '',
      messageText: const SizedBox(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: orangeClr,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      borderRadius: 4.r,
      duration: const Duration(seconds: 2),
      colorText: whiteClr);
}

Future<dynamic> showDialogBox({
  required String title,
  required String middleText,
  required void Function()? onPressedCancel,
  required void Function()? onPressedConfirm,
}) {
  return Get.defaultDialog(
    title: title,
    titleStyle: myStyle(25.sp, FontWeight.bold, blackClr),
    middleText: middleText,
    middleTextStyle: myStyle(20.sp, FontWeight.normal, blackClr),
    backgroundColor: whiteClr,
    barrierDismissible: false,
    radius: 15.r,
    actions: [
      TextButton(
          onPressed: onPressedCancel,
          child: Text(
            'No',
            style: myStyle(20.sp, FontWeight.bold, blackClr),
          )),
      TextButton(
          onPressed: onPressedConfirm,
          child: Text(
            'Yes',
            style: myStyle(20.sp, FontWeight.bold, orangeClr),
          )),
    ],
  );
}

SnackbarController customErrorMessage({required dynamic message}) {
  return Get.snackbar('Error', message,
      icon: const Icon(Icons.error_outline, color: blackClr,),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: redClr,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      duration: const Duration(seconds: 2),
      colorText: blackClr);
}

SnackbarController customSuccessMessage({required dynamic message}) {
  return Get.snackbar('Success', message,
      icon: const Icon(Icons.verified_outlined, color: blackClr,),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: greenClr,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      duration: const Duration(seconds: 2),
      colorText: blackClr);
}

SpinKitFadingCircle customCircularProgressIndicator = SpinKitFadingCircle(
  color: orangeClr,
  size: 50.0.r,
);
