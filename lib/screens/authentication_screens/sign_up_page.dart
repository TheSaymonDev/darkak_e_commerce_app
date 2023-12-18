import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/validator.dart';
import 'package:e_commerce_app/reusable/widgets/app_back_appbar.dart';
import 'package:e_commerce_app/reusable/widgets/app_card_style.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/reusable/widgets/app_sign_in_with_button.dart';
import 'package:e_commerce_app/reusable/widgets/app_text_form_field.dart';
import 'package:e_commerce_app/screens/authentication_screens/sign_in_page.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBackAppBar(onPressed: (){
        Get.back();
      },),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                    Text('Sign Up', style: myTextStyle(30.sp, FontWeight.bold, textClr),),
                    Gap(40.h),
                    AppTextFormField(
                      labelText: 'Name',
                      controller: _nameController,
                      validator: nameValidator,
                    ),
                    Gap(35.h),
                    AppTextFormField(
                      labelText: 'Mobile Number',
                      controller: _mobileController,
                      keyBoardType: TextInputType.phone,
                    ),
                    Gap(35.h),
                    AppTextFormField(
                        labelText: 'Email', controller: _emailController, validator: emailValidator,),
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
                            isObscure ? Icons.visibility_off : Icons.visibility,
                            color: textClr,
                            size: 25.sp,
                          )),
                      obscureText: isObscure,
                    ),
                    Gap(38.h),
                    AppOrangeButton(onPressed: () {
                      Get.to(BottomNavBarPage());
                    }, buttonName: 'SIGN UP', width: double.infinity.w,)
                  ],
                ),
              ),
              Gap(30.h),
              Text('- OR -', style: myTextStyle(20.sp, FontWeight.normal, textClr),),
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
                    "Already have account?",
                    style: myTextStyle(20.sp, FontWeight.normal, textClr),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const SignInPage());
                      },
                      child: Text(
                        'Login',
                        style: myTextStyle(20.sp, FontWeight.normal, orangeColor),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
