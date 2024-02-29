import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color filledClr=  Color(0xffEAEAEA);
const Color orangeClr=  Color(0xffF85606);
const Color whiteClr=  Color(0xffFFFFFF);
const Color blackClr=  Color(0xff000000);
const Color yellowClr=  Color(0xffEBE300);
const Color greyClr=  Color(0xff808080);
const Color redClr = Color(0xffFF5C5C);
const Color greenClr = Color(0xff43be43);

ThemeData customThemeStyle = ThemeData(
  fontFamily: 'Gumela Arabic',
  scaffoldBackgroundColor: whiteClr,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 25.sp,
      color: blackClr,
      fontWeight: FontWeight.normal,
      height: 1,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.sp,
      color: blackClr,
      fontWeight: FontWeight.normal,
      height: 1,
    ),
    bodySmall: TextStyle(
      fontSize: 15.sp,
      color: blackClr,
      fontWeight: FontWeight.normal,
      height: 1,
    ),
    titleLarge: TextStyle(
      fontSize: 25.sp,
      color: blackClr,
      fontWeight: FontWeight.bold,
      height: 1,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      color: blackClr,
      fontWeight: FontWeight.bold,
      height: 1,
    ),
    titleSmall: TextStyle(
      fontSize: 15.sp,
      color: blackClr,
      fontWeight: FontWeight.bold,
      height: 1,
    ),
  ),
);

const String watchImage = 'assets/images/watch.jpg';
const String sareeImage = 'assets/images/product-img.png';
const String takaSign = '৳';
const String myBankCard = 'assets/images/card.png';


const String baseUrl = "https://api.darkak.com.bd/api/v1";
const Map<String, String> requestHeader = {"Content-Type": "application/json"};