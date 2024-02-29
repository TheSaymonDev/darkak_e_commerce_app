import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/auth_widgets/custom_sign_in_with_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/otp_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_in_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;
  String? userId;
  final Map<String, String> _formValues = {
    "name": "",
    "mobile": "",
    "email": "",
    "password": "",
  };
  bool isLoading = false;
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _formValues["name"] = _nameController.text.trim();
      _formValues["mobile"] = _mobileController.text.trim();
      _formValues["email"] = _emailController.text.trim();
      _formValues["password"] = _passwordController.text.trim();
       userId = await registrationRequest(_formValues);
      if (userId != null) {
        Get.offAll(OtpVerificationScreen(userId: userId,));
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(onPressedBack: () {
        Get.back();
      }),
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
                width: double.infinity.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                      ),
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
                        validator: mobileValidator,
                      ),
                      Gap(35.h),
                      CustomTextFormField(
                        labelText: 'Email',
                        controller: _emailController,
                        validator: emailValidator,
                      ),
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
                                isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: blackClr,
                                size: 25.sp,
                              )),
                        ),
                        obscureText: isObscure,
                      ),
                      Gap(38.h),
                      isLoading == true?customCircularProgressIndicator: CustomElevatedButton(
                        onPressed: () {
                          _formOnSubmit();
                        },
                        buttonName: 'SIGN UP',
                        width: double.infinity.w,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(30.h),
              Text(
                '- OR -',
                style: Get.textTheme.bodyMedium,
              ),
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
                    style: Get.textTheme.bodyMedium,
                  ),
                  Gap(8.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignInScreen());
                    },
                    child: Text(
                      'Login',
                      style: Get.textTheme.titleMedium!.copyWith(color: orangeClr),
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
