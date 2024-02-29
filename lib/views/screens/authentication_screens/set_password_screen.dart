import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/verification_success_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Password',
                  style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                ),
                Gap(36.h),
                CustomTextFormField(
                  labelText: 'New Password',
                  controller: _newPasswordController,
                  validator: passwordValidator,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscureNew = !_isObscureNew;
                        });
                      },
                      icon: Icon(
                        _isObscureNew ? Icons.visibility_off : Icons.visibility,
                        color: blackClr,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  obscureText: _isObscureNew,
                ),
                Gap(36.h),
                CustomTextFormField(
                  labelText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  validator: passwordValidator,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscureConfirm = !_isObscureConfirm;
                          });
                        },
                        icon: Icon(
                          _isObscureConfirm
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: blackClr,
                          size: 25.sp,
                        )),
                  ),
                  obscureText: _isObscureConfirm,
                ),
                Gap(50.h),
                CustomElevatedButton(
                    onPressed: () {
                      Get.to(() => const VerificationSuccessScreen());
                    },
                    buttonName: 'CONTINUE',
                    width: double.infinity.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
