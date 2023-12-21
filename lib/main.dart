
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
import 'package:e_commerce_app/screens/onboarding_screens/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: OnboardingPage(),
    );
  }
}
