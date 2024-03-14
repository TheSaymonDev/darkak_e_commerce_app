import 'package:darkak_e_commerce_app/controllers/authentication_controllers/sign_up_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/auth_widgets/custom_sign_in_with_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_in_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController _signUpController = Get.find<SignUpController>();

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
                Urls.appLogoSvg,
                height: 86.h,
                width: 110.w,
              ),
              Gap(40.h),
              CustomCardStyle(
                width: double.infinity.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Form(
                  key: _signUpController.formKey,
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
                        controller: _signUpController.nameController,
                        validator: Validators().nameValidator,
                      ),
                      Gap(35.h),
                      CustomTextFormField(
                        labelText: 'Mobile Number',
                        controller: _signUpController.mobileController,
                        keyBoardType: TextInputType.phone,
                        validator: Validators().mobileValidator,
                      ),
                      Gap(35.h),
                      CustomTextFormField(
                        labelText: 'Email',
                        controller: _signUpController.emailController,
                        validator: Validators().emailValidator,
                      ),
                      Gap(35.h),
                      GetBuilder<SignUpController>(
                        builder: (controller) {
                          return CustomTextFormField(
                            labelText: 'Password',
                            controller: controller.passwordController,
                            validator: Validators().passwordValidator,
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
                          );
                        }
                      ),
                      Gap(38.h),
                      GetBuilder<SignUpController>(
                        builder: (controller) => controller.isLoading == true
                            ? customCircularProgressIndicator
                            : CustomElevatedButton(
                          onPressed: () {
                            controller.formOnSubmit();
                          },
                          buttonName: 'SIGN UP',
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
                      Get.to(() =>  SignInScreen());
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
