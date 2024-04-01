import 'package:darkak_e_commerce_app/controllers/authentication_controllers/set_password_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_in_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SetPasswordScreen extends StatelessWidget {
  final String? userId;
  final String? otp;

  SetPasswordScreen({super.key, required this.userId, required this.otp});

  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                    'Change Password',
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(36.h),
                  GetBuilder<SetPasswordController>(builder: (controller) {
                    return CustomTextFormField(
                      labelText: 'New Password',
                      controller: newPasswordController,
                      validator: Validators().passwordValidator,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: IconButton(
                          onPressed: () => controller.toggleObscureN(),
                          icon: Icon(
                            controller.isObscureNew
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: blackClr,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      obscureText: controller.isObscureNew,
                    );
                  }),
                  Gap(36.h),
                  GetBuilder<SetPasswordController>(builder: (controller) {
                    return CustomTextFormField(
                      labelText: 'Confirm Password',
                      controller: confirmPasswordController,
                      validator: (value) => Validators()
                          .confirmPasswordValidator(
                              value, newPasswordController),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: IconButton(
                            onPressed: () => controller.toggleObscureC(),
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
                  }),
                  Gap(50.h),
                  GetBuilder<SetPasswordController>(
                      builder: (controller) => controller.isLoading
                          ? customCircularProgressIndicator
                          : CustomElevatedButton(
                              onPressed: () => _formOnSubmit(controller),
                              buttonName: 'DONE',
                              width: double.infinity.w,
                            ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _clearData() {
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  void _formOnSubmit(SetPasswordController controller) async {
    if (formKey.currentState?.validate() ?? false) {
      final result = await controller.formOnSubmit(
          userId: userId!,
          otp: otp!,
          password: newPasswordController.text.trim());
      if (result == true) {
        _clearData();
        Get.offAll(SignInScreen());
      }
    }
  }
}
