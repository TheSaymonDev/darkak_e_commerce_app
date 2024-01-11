import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/validator.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_sign_in_with_button.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/screens/authentication_screens/sign_in_page.dart';
import 'package:darkak_e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
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
      backgroundColor: backgroundColor,
      appBar: AppbarTextviewWithBack(onPressedBack: (){Get.back();}),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
              CustomCardStyle(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign Up', style: myTextStyle(30.sp, FontWeight.bold, textColor),),
                    Gap(40.h),
                    CustomTextFormField(
                      labelText: 'Name',
                      controller: _nameController,
                      validator: nameValidator,
                    ),
                    Gap(35.h),
                    CustomTextFormField(
                      labelText: 'Mobile Number',
                      controller: _mobileController,
                      keyBoardType: TextInputType.phone,
                    ),
                    Gap(35.h),
                    CustomTextFormField(
                        labelText: 'Email', controller: _emailController, validator: emailValidator,),
                    Gap(35.h),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: _passwordController,
                      validator: passwordValidator,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                              isObscure ? Icons.visibility_off : Icons.visibility,
                              color: textColor,
                              size: 25.sp,
                            )),
                      ),
                      obscureText: isObscure,
                    ),
                    Gap(38.h),
                    CustomOrangeButton(onPressed: () {
                      Get.to(()=>const BottomNavBarPage());
                    }, buttonName: 'SIGN UP', width: double.infinity.w,)
                  ],
                ),
              ),
              Gap(30.h),
              Text('- OR -', style: myTextStyle(20.sp, FontWeight.normal, textColor),),
              Gap(30.h),
              CustomSignInWithButton(
                  onPressed: () {},
                  imgUrl: 'assets/images/facebook.svg',
                  name: 'Sign In with Facebook'),
              Gap(10.h),
              CustomSignInWithButton(
                  onPressed: () {},
                  imgUrl: 'assets/images/google.svg',
                  name: 'Sign In with Google'),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: myTextStyle(20.sp, FontWeight.normal, textColor),
                  ),
                  Gap(8.w),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const SignInPage());
                    },
                    child: Text(
                      'Login',
                      style: myTextStyle(20.sp, FontWeight.bold, orangeColor),
                    ),
                  )
                ],
              ),
              Gap(32.h),
            ],
          ),
        ),
      ),
    );
  }
}
