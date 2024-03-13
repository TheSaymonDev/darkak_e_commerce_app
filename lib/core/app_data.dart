import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

const Color filledClr=  Color(0xffEAEAEA);
const Color orangeClr=  Color(0xffF85606);
const Color whiteClr=  Color(0xffFFFFFF);
const Color blackClr=  Color(0xff000000);
const Color yellowClr=  Color(0xffEBE300);
const Color greyClr=  Color(0xff808080);
const Color redClr = Color(0xffFF5C5C);
const Color greenClr = Color(0xff43be43);

const String watchImage = 'assets/images/watch.jpg';
const String sareeImage = 'assets/images/product-img.png';
const String takaSign = '৳';
const String myBankCard = 'assets/images/card.png';

const String imgUrl = 'https://api.darkak.com.bd/';
const String baseUrl = "https://api.darkak.com.bd/api/v1";
const Map<String, String> requestHeader = {"Content-Type": "application/json"};
Map<String, String> requestHeaderWithToken = {"Content-Type": "application/json", "Authorization":"Bearer ${SharedPreferencesService().getToken()}"};
