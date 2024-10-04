import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/controllers/identity_verification_controller.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/models/identity_verification_model.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IdentityVerificationScreen extends StatelessWidget {
  IdentityVerificationScreen({super.key});

  final _identityVerificationController =
      Get.find<IdentityVerificationController>();

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
              key: _identityVerificationController.formKey,
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
                    controller:
                        _identityVerificationController.identifierController,
                    validator: AppValidators().identifierValidator,
                  ),
                  Gap(40.h),
                  GetBuilder<IdentityVerificationController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () => _formOnSubmit(controller),
                            buttonName: 'SEND',
                            width: double.infinity.w),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmit(IdentityVerificationController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.identityVerify(
          identityVerificationData: IdentityVerificationModel(
              identity: controller.identifierController.text.trim()));
      if (result == true) {
        Get.toNamed(AppRoutes.otpVerificationScreen,
            arguments: {'userId': controller.userId, 'isForgetOTP': true});
      }
    }
  }
}
