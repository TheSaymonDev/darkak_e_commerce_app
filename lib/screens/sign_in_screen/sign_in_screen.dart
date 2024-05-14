import 'package:darkak_e_commerce_app/screens/sign_in_screen/controller/sign_in_controller.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/model/sign_in.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/home_screen/home_screen.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/widgets/auth_widgets/custom_sign_in_with_button.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/identity_verification_screen.dart';
import 'package:darkak_e_commerce_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    key: _formKey,
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
                          controller: _identifierController,
                          validator: AppValidators().identifierValidator,
                        ),
                        Gap(35.h),
                        GetBuilder<SignInController>(
                          builder: (controller) => CustomTextFormField(
                            labelText: 'Password',
                            controller: _passwordController,
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
                            Get.to(
                              () => IdentityVerificationScreen(),
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
    _identifierController.clear();
    _passwordController.clear();
  }

  void _formOnSubmit(SignInController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.signInUser(
          signIn: SignIn(
              identity: _identifierController.text.trim(),
              password: _passwordController.text.trim()));
      if (result == true) {
        _clearData();
        Get.offAll(() => const HomeScreen());
      }
    }
  }
}
