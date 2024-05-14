import 'package:darkak_e_commerce_app/screens/sign_up_screen/model/sign_up.dart';
import 'package:darkak_e_commerce_app/screens/sign_up_screen/controller/sign_up_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:darkak_e_commerce_app/widgets/auth_widgets/custom_sign_in_with_button.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                AppUrls.appLogoSvg,
                height: 86.h,
                width: 110.w,
              ),
              Gap(40.h),
              CustomCard(
                width: double.infinity.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style:
                            Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                      ),
                      Gap(40.h),
                      CustomTextFormField(
                        labelText: 'Name',
                        controller: _nameController,
                        validator: AppValidators().nameValidator,
                      ),
                      Gap(35.h),
                      CustomTextFormField(
                        labelText: 'Mobile Number',
                        controller: _mobileController,
                        keyBoardType: TextInputType.phone,
                        validator: AppValidators().mobileValidator,
                      ),
                      Gap(35.h),
                      CustomTextFormField(
                        labelText: 'Email',
                        controller: _emailController,
                        validator: AppValidators().emailValidator,
                      ),
                      Gap(35.h),
                      GetBuilder<SignUpController>(builder: (controller) {
                        return CustomTextFormField(
                          labelText: 'Password',
                          controller: _passwordController,
                          validator: AppValidators().passwordValidator,
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
                      }),
                      Gap(38.h),
                      GetBuilder<SignUpController>(
                        builder: (controller) => controller.isLoading
                            ? customCircularProgressIndicator
                            : CustomElevatedButton(
                                onPressed: () => _formOnSubmit(controller),
                                buttonName: 'SIGN UP',
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
                      Get.to(() => SignInScreen());
                    },
                    child: Text(
                      'Login',
                      style:
                          Get.textTheme.titleMedium!.copyWith(color: orangeClr),
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

  void _clearData() {
    _emailController.clear();
    _nameController.clear();
    _mobileController.clear();
    _passwordController.clear();
  }

  _formOnSubmit(SignUpController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.signUpUser(
        signUp: SignUp(
            email: _emailController.text.trim(),
            mobile: _mobileController.text.trim(),
            name: _nameController.text,
            password: _passwordController.text.trim()),
      );
      if (result == true) {
        _clearData();
        Get.offAll(() => OtpVerificationScreen(userId: controller.userId));
      }
    }
  }
}
