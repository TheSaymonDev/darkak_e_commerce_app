import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/set_password_screen/controllers/set_password_controller.dart';
import 'package:darkak_e_commerce_app/screens/set_password_screen/models/set_password_model.dart';
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

class SetPasswordScreen extends StatelessWidget {
  SetPasswordScreen({super.key});

  final _setPasswordController = Get.find<SetPasswordController>();

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
              key: _setPasswordController.formKey,
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
                      controller: _setPasswordController.newPasswordController,
                      validator: AppValidators().passwordValidator,
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
                      controller:
                          _setPasswordController.confirmPasswordController,
                      validator: (value) => AppValidators()
                          .confirmPasswordValidator(value,
                              _setPasswordController.newPasswordController),
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
    _setPasswordController.newPasswordController.clear();
    _setPasswordController.confirmPasswordController.clear();
  }

  void _formOnSubmit(SetPasswordController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.setNewPassword(
          setPasswordData: SetPasswordModel(
              userId: controller.userId,
              password: controller.newPasswordController.text.trim(),
              otp: controller.otp));
      if (result == true) {
        _clearData();
       Get.offAllNamed(AppRoutes.signInScreen);
      }
    }
  }
}
