import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controllers/otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controllers/resend_otp_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/models/otp_verification_model.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/models/resend_otp_model.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final _otpVerificationController = Get.find<OtpVerificationController>();

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
          child: CustomCard(
            width: double.infinity.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: _otpVerificationController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification',
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(18.h),
                  Text(
                      'A 6 - Digit PIN has been sent to your email address or mobile number, enter it below to continue',
                      style:
                          Get.textTheme.bodyMedium!.copyWith(color: greyClr)),
                  Gap(35.h),
                  PinCodeTextField(
                    validator: AppValidators().pinValidator,
                    controller: _otpVerificationController.otpController,
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    pinTheme: pinTheme(),
                    keyboardType: TextInputType.phone,
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't received a code?",
                        style: Get.textTheme.bodyMedium,
                      ),
                      Gap(8.w),
                      GetBuilder<TimerController>(
                        builder: (controller) {
                          return controller.showResendButton
                              ? GestureDetector(
                                  onTap: () {
                                    Get.find<ResendOTPController>().resendOTP(
                                        resendOtpData: ResendOtpModel(
                                            userId: _otpVerificationController
                                                .userId));
                                  },
                                  child: Text('Resend Code',
                                      style: Get.textTheme.titleMedium!
                                          .copyWith(color: orangeClr)),
                                )
                              : Text(controller.getFormattedDuration(),
                                  style: Get.textTheme.titleMedium!
                                      .copyWith(color: orangeClr));
                        },
                      ),
                    ],
                  ),
                  Gap(35.h),
                  Visibility(
                    visible: _otpVerificationController.isForgetOTP,
                    replacement: GetBuilder<OtpVerificationController>(
                      builder: (controller) => controller.isLoading
                          ? customCircularProgressIndicator
                          : CustomElevatedButton(
                              onPressed: () =>
                                  _registerFormOnSubmit(controller),
                              buttonName: 'CONTINUE',
                              width: double.infinity.w),
                    ),
                    child: GetBuilder<OtpVerificationController>(
                      builder: (controller) => controller.isLoading
                          ? customCircularProgressIndicator
                          : CustomElevatedButton(
                              onPressed: () => _forgetFormOnSubmit(controller),
                              buttonName: 'CONTINUE',
                              width: double.infinity.w),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerFormOnSubmit(OtpVerificationController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.verifyOTP(
          url: AppUrls.otpVerificationUrl,
          otpVerificationData: OtpVerificationModel(
              userId: controller.userId,
              otp: controller.otpController.text.trim()));
      if (result == true) {
        Get.offAllNamed(AppRoutes.signInScreen);
      }
    }
  }

  void _forgetFormOnSubmit(OtpVerificationController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.verifyOTP(
          url: AppUrls.forgetOtpVerificationUrl,
          otpVerificationData: OtpVerificationModel(
              userId: controller.userId,
              otp: controller.otpController.text.trim()));
      if (result == true) {
        Get.offNamed(AppRoutes.setPasswordScreen, arguments: {
          'userId': controller.userId,
          'otp': controller.otpController.text.trim()
        });
      }
    }
  }
}
