import 'package:darkak_e_commerce_app/controllers/authentication_controllers/sign_in_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/auth_widgets/custom_sign_in_with_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/identity_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final identifierController = TextEditingController();
  final passwordController = TextEditingController();

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
                  Urls.appLogoSvg,
                  height: 86.h,
                  width: 110.w,
                ),
                Gap(40.h),
                CustomCard(
                    width: double.infinity.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Form(
                        key: formKey,
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
                                controller: identifierController,
                                validator: Validators().identifierValidator,
                              ),
                              Gap(35.h),
                              GetBuilder<SignInController>(
                                builder: (controller) => CustomTextFormField(
                                  labelText: 'Password',
                                  controller: passwordController,
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
                                ),
                              ),
                              Gap(20.h),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => EmailVerificationScreen(),
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
                                builder: (controller) => Visibility(
                                  visible: controller.isLoading == false,
                                  replacement: customCircularProgressIndicator,
                                  child: CustomElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState?.validate() ??
                                            false) {
                                          final result =
                                              await controller.formOnSubmit(
                                            identity: identifierController.text.trim(),
                                            password: passwordController.text.trim(),
                                          );
                                          if (result == true) {
                                           _clearData();
                                            Get.offAll(
                                                () => const HomeScreen());
                                          }
                                        }
                                      },
                                      buttonName: 'SIGN IN',
                                      width: double.infinity.w),
                                ),
                              )
                            ]))),
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
                        Get.to(() => SignUpScreen());
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

  void _clearData() {
    identifierController.clear();
    passwordController.clear();
  }
}
