import 'package:darkak_e_commerce_app/controller_binders.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/screens/home_screen/home_screen.dart';
import 'package:darkak_e_commerce_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  final showHome = SharedPreferencesService().getSavedScreen();
  runApp(MyApp(
    screen: showHome == true ? const HomeScreen() : const OnboardingScreen(),
  ));
}

class MyApp extends StatelessWidget {
  final Widget? screen;
  const MyApp({super.key, this.screen});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Gumela Arabic',
            scaffoldBackgroundColor: const Color(0xFFFAF9F6),
            appBarTheme: const AppBarTheme(color: whiteClr),
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
          ),
          themeMode: ThemeMode.light,
          initialBinding: ControllerBinder(),
          home: screen,
        );
      },
    );
  }
}
