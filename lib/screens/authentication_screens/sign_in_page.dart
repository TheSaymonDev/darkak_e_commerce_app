import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/validator.dart';
import 'package:e_commerce_app/reusable/widgets/app_card_style.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/reusable/widgets/app_sign_in_with_button.dart';
import 'package:e_commerce_app/reusable/widgets/app_text_form_field.dart';
import 'package:e_commerce_app/screens/authentication_screens/forgot_password_page.dart';
import 'package:e_commerce_app/screens/authentication_screens/sign_up_page.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _identifierController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(30.h),
                SvgPicture.asset(
                  'assets/images/app-logo.svg',
                  height: 86.h,
                  width: 110.w,
                ),
                Gap(40.h),
                AppCardStyle(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: myTextStyle(30.sp, FontWeight.bold, textColor),
                      ),
                      Gap(10.h),
                      Text(
                        'Sign in to Continue',
                        style: myTextStyle(20.sp, FontWeight.normal, textColor),
                      ),
                      Gap(55.h),
                      AppTextFormField(
                        labelText: 'Email or Mobile',
                        controller: _identifierController,
                        validator: identifierValidator,
                      ),
                      Gap(35.h),
                      AppTextFormField(
                        labelText: 'Password',
                        controller: _passwordController,
                        validator: passwordValidator,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: textColor,
                              size: 25.sp,
                            )),
                        obscureText: isObscure,
                      ),
                      Gap(20.h),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.to(ForgotPasswordPage());
                              },
                              child: Text(
                                'Forgot Password?',
                                style: myTextStyle(
                                    20.sp, FontWeight.normal, textColor),
                              ))),
                      Gap(20.h),
                      AppOrangeButton(
                        onPressed: () {
                          Get.to(BottomNavBarPage());
                        },
                        buttonName: 'SIGN IN',
                        width: double.infinity.w,
                      )
                    ],
                  ),
                ),
                Gap(30.h),
                Text(
                  '- OR -',
                  style: myTextStyle(20.sp, FontWeight.normal, textColor),
                ),
                Gap(30.h),
                AppSignInWithButton(
                    onPressed: () {},
                    imgUrl: 'assets/images/facebook.svg',
                    name: 'Sign In with Facebook'),
                Gap(10.h),
                AppSignInWithButton(
                    onPressed: () {},
                    imgUrl: 'assets/images/google.svg',
                    name: 'Sign In with Google'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: myTextStyle(20.sp, FontWeight.normal, textColor),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SignUpPage());
                        },
                        child: Text(
                          'Create Account',
                          style: myTextStyle(
                              20.sp, FontWeight.normal, orangeColor),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
