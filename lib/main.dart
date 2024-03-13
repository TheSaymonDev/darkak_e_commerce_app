import 'package:darkak_e_commerce_app/controllers/authentication_controllers/forget_otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/identity_verification_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/set_password_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/sign_up_controller.dart';
import 'package:darkak_e_commerce_app/controllers/authentication_controllers/sign_in_controller.dart';
import 'package:darkak_e_commerce_app/controllers/onboarding_controller.dart';
import 'package:darkak_e_commerce_app/controllers/productList_controller.dart';
import 'package:darkak_e_commerce_app/controllers/profile_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  String token = SharedPreferencesService().getToken();
  runApp(MyApp(
    screen: token.isNotEmpty ? HomeScreen() : const OnboardingScreen(),
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
            scaffoldBackgroundColor: whiteClr,
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

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(OtpVerificationController());
    Get.put(IdentityVerificationController());
    Get.put(ForgetOtpVerificationController());
    Get.put(SetPasswordController());
    Get.put(ProductListController());
    Get.put(ProfileController());
  }
}
