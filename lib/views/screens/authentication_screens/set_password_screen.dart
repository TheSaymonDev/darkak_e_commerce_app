import 'package:darkak_e_commerce_app/controllers/authentication_controllers/set_password_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SetPasswordScreen extends StatelessWidget {

  final String? userId;
  final String? otp;
  SetPasswordScreen({super.key, required this.userId, required this.otp});

  final SetPasswordController _setPasswordController= Get.find<SetPasswordController>();

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
              key: _setPasswordController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Password',
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(36.h),
                  GetBuilder<SetPasswordController>(
                    builder: (controller) {
                      return CustomTextFormField(
                        labelText: 'New Password',
                        controller: controller.newPasswordController,
                        validator: Validators().passwordValidator,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: IconButton(
                            onPressed: () {
                              controller.toggleObscureN();
                            },
                            icon: Icon(
                              controller.isObscureNew
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: blackClr,
                              size: 25.sp,
                            ),
                          ),
                        ),
                        obscureText:  controller.isObscureNew,
                      );
                    }
                  ),
                  Gap(36.h),
                  GetBuilder<SetPasswordController>(
                    builder: (controller) {
                      return CustomTextFormField(
                        labelText: 'Confirm Password',
                        controller: controller.confirmPasswordController,
                        validator: (value) =>
                            Validators().confirmPasswordValidator(value, controller.newPasswordController),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: IconButton(
                              onPressed: () {
                               controller.toggleObscureC();
                              },
                              icon: Icon(
                                controller.isObscureConfirm
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: blackClr,
                                size: 25.sp,
                              )),
                        ),
                        obscureText: controller.isObscureConfirm,
                      );
                    }
                  ),
                  Gap(50.h),
                  GetBuilder<SetPasswordController>(
                    builder: (controller) => controller.isLoading == true
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                      onPressed: () {
                        controller.formOnSubmit(userId!, otp!);
                      },
                      buttonName: 'CONTINUE',
                      width: double.infinity.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
