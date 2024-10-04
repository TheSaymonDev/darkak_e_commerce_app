import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/controllers/sign_in_controller.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/models/sign_in_model.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/widgets/auth_widgets/custom_sign_in_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _signInController = Get.find<SignInController>();

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
                  AppUrls.appLogoSvg,
                  height: 86.h,
                  width: 110.w,
                ),
                Gap(40.h),
                CustomCard(
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
                          validator: AppValidators().identifierValidator,
                        ),
                        Gap(35.h),
                        GetBuilder<SignInController>(
                          builder: (controller) => CustomTextFormField(
                            labelText: 'Password',
                            controller: _signInController.passwordController,
                            validator: AppValidators().passwordValidator,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: IconButton(
                                  onPressed: () => controller.toggleObscure(),
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
                           Get.toNamed(AppRoutes.identityVerificationScreen);
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
                          builder: (controller) => controller.isLoading
                              ? customCircularProgressIndicator
                              : CustomElevatedButton(
                                  onPressed: () => _formOnSubmit(controller),
                                  buttonName: 'SIGN IN',
                                  width: double.infinity.w),
                        )
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
                        Get.toNamed(AppRoutes.signUpScreen);
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
    _signInController.identifierController.clear();
    _signInController.passwordController.clear();
  }

  void _formOnSubmit(SignInController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.signInUser(
          signInData: SignInModel(
              identity: controller.identifierController.text.trim(),
              password: controller.passwordController.text.trim()));
      if (result == true) {
        _clearData();
        Get.offAllNamed(AppRoutes.homeScreen);
      }
    }
  }
}
