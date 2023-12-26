import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/validator.dart';
import 'package:e_commerce_app/reusable/widgets/app_back_appbar.dart';
import 'package:e_commerce_app/reusable/widgets/app_card_style.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/reusable/widgets/app_text_form_field.dart';
import 'package:e_commerce_app/screens/authentication_screens/successfully_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBackAppBar(onPressed: () {Get.back();}),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            AppCardStyle(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Change Password', style: myTextStyle(30.sp, FontWeight.bold, textColor),),
                    Gap(36.h),
                    AppTextFormField(
                      labelText: 'New Password',
                      controller: _newPasswordController,
                      validator: passwordValidator,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscureNew = !_isObscureNew;
                          });
                        },
                        icon: Icon(
                          _isObscureNew ? Icons.visibility_off : Icons.visibility,
                          color: textColor,
                          size: 25.sp,
                        ),
                      ),
                      obscureText: _isObscureNew,
                    ),
                    Gap(36.h),
                    AppTextFormField(
                      labelText: 'Confirm Password',
                      controller: _confirmPasswordController,
                      validator: passwordValidator,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscureConfirm = !_isObscureConfirm;
                            });
                          },
                          icon: Icon(
                            _isObscureConfirm
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: textColor,
                            size: 25.sp,
                          )),
                      obscureText: _isObscureConfirm,
                    ),
                    Gap(50.h),
                    AppOrangeButton(
                        onPressed: () {
                          Get.to(SuccessfullyPage());
                        },
                        buttonName: 'CONTINUE',
                        width: double.infinity.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
