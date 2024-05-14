import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/controller/timer_controller.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/model/otp_verification.dart';
import 'package:darkak_e_commerce_app/screens/otp_verification_screen/model/resend_otp.dart';
import 'package:darkak_e_commerce_app/screens/set_password_screen/set_password_screen.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/sign_in_screen.dart';
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

class OtpVerificationScreen extends StatefulWidget {
  final bool isForgetOTP;
  final String? userId;
  const OtpVerificationScreen(
      {super.key, required this.userId, this.isForgetOTP = false});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<TimerController>().startTimer();
  }

  @override
  void dispose() {
    Get.find<TimerController>().timer.cancel();
    super.dispose();
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
          child: CustomCard(
            width: double.infinity.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: formKey,
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
                    controller: _otpController,
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
                          print(controller.getFormattedDuration());
                          return controller.showResendButton
                              ? GestureDetector(
                                  onTap: () {
                                    Get.find<ResendOTPController>().resendOTP(
                                        resendOTP:
                                            ResendOTP(userId: widget.userId));
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
                    visible: widget.isForgetOTP,
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

  void _clearData() {
    _otpController.clear();
  }

  void _registerFormOnSubmit(OtpVerificationController controller) async {
    if (formKey.currentState?.validate() ?? false) {
      final result = await controller.verifyOTP(
        url: AppUrls.otpVerificationUrl,
          otpVerification: OtpVerification(
              userId: widget.userId!, otp: _otpController.text.trim()));
      if (result == true) {
        _clearData();
        Get.offAll(() => SignInScreen());
      }
    }
  }

  void _forgetFormOnSubmit(OtpVerificationController controller) async {
    if (formKey.currentState?.validate() ?? false) {
      final result = await controller.verifyOTP(
        url: AppUrls.forgetOtpVerificationUrl,
          otpVerification: OtpVerification(
              userId: widget.userId!, otp: _otpController.text.trim()));
      if (result == true) {
        Get.off(() => SetPasswordScreen(
            userId: widget.userId, otp: _otpController.text.trim()));
      }
    }
  }
}
