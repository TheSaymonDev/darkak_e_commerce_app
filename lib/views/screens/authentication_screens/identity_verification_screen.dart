import 'package:darkak_e_commerce_app/controllers/authentication_controllers/identity_verification_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/forgot_otp_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final identifierController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          child: CustomCardStyle(
            width: double.infinity.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot password',
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(18.h),
                  Text(
                    'Please enter your mobile number\nor email to received verification code',
                    style: Get.textTheme.bodyMedium!.copyWith(color: greyClr),
                  ),
                  Gap(50.h),
                  CustomTextFormField(
                    labelText: 'Email or Mobile',
                    controller: identifierController,
                    validator: Validators().identifierValidator,
                  ),
                  Gap(40.h),
                  GetBuilder<IdentityVerificationController>(
                    builder: (controller) => Visibility(
                      visible: controller.isLoading == false,
                      replacement: customCircularProgressIndicator,
                      child: CustomElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              final result = await controller.formOnSubmit(
                                  identity: identifierController.text.trim());
                              if (result == true) {
                                _clearData();
                                Get.off(() => ForgotOtpVerificationScreen(
                                    userId: controller.userId));
                              }
                            }
                          },
                          buttonName: 'SEND',
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
    identifierController.clear();
  }
}