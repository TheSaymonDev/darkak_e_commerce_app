import 'package:darkak_e_commerce_app/controllers/authentication_controllers/sign_in_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/auth_widgets/custom_sign_in_with_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/email_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_up_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {

  SignInScreen({super.key});
  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: SafeArea(
        child: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(30.h),
                SvgPicture.asset(
                  'assets/images/app-logo.svg',
                  height: 86.h,
                  width: 110.w,
                ),
                Gap(40.h),
                CustomCardStyle(
                  width: double.infinity.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Form(
                    key: _signInController.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: Get.textTheme.titleLarge!
                              .copyWith(fontSize: 30.sp),
                        ),
                        Gap(10.h),
                        Text(
                          'Sign in to Continue',
                          style: Get.textTheme.bodyMedium,
                        ),
                        Gap(55.h),
                        CustomTextFormField(
                          labelText: 'Email or Mobile',
                          controller: _signInController.identifierController,
                          validator: identifierValidator,
                        ),
                        Gap(35.h),
                        GetBuilder<SignInController>(
                          builder: (controller) => CustomTextFormField(
                            labelText: 'Password',
                            controller: controller.passwordController,
                            validator: passwordValidator,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: IconButton(
                                  onPressed: () {
                                    controller.toggleObscure();
                                  },
                                  icon: Icon(
                                    controller.isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: blackClr,
                                    size: 25.sp,
                                  )),
                            ),
                            obscureText: controller.isObscure,
                          ),
                        ),
                        Gap(20.h),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () =>  EmailVerificationScreen(),
                            );
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: Get.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        Gap(30.h),
                        GetBuilder<SignInController>(
                          builder: (controller) => controller.isLoading == true
                              ? customCircularProgressIndicator
                              : CustomElevatedButton(
                                  onPressed: () {
                                    controller.formOnSubmit();
                                  },
                                  buttonName: 'SIGN IN',
                                  width: double.infinity.w,
                                ),
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
                Gap(30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Get.textTheme.bodyMedium,
                    ),
                    Gap(8.w),
                    GestureDetector(
                      onTap: () {
                        Get.to(() =>  SignUpScreen());
                      },
                      child: Text(
                        'Create Account',
                        style: Get.textTheme.titleMedium!
                            .copyWith(color: orangeClr),
                      ),
                    ),
                  ],
                ),
                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
