import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/validator.dart';
import 'package:e_commerce_app/reusable/widgets/app_back_appbar.dart';
import 'package:e_commerce_app/reusable/widgets/app_card_style.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/reusable/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: backgroundClr,
      appBar: AppBackAppBar(onPressed: () {}),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            AppCardStyle(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Change Password'),
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
                        color: textClr,
                        size: 25.sp,
                      ),
                    ),
                    obscureText: _isObscureNew,
                  ),
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
                          color: textClr,
                          size: 25.sp,
                        )),
                    obscureText: _isObscureConfirm,
                  ),
                  AppOrangeButton(
                      onPressed: () {},
                      buttonName: 'CONTINUE',
                      width: double.infinity.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
