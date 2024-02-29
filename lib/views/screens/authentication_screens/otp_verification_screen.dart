import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/utils/http_client.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {

  final String? userId;
  const OtpVerificationScreen({super.key, required this.userId});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _pinCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final Map<String, String> _formValues = {
    "userId": "",
    "otp": "",
  };
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _formValues['userId'] = widget.userId!;
      _formValues['otp'] = _pinCodeController.text.trim();
      bool verifyPinCodeSuccess = await verifyPinCodeRequest(_formValues);
      if (verifyPinCodeSuccess == true) {
        Get.offAll(const HomeScreen());
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
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
          child: CustomCardStyle(
            width: double.infinity.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification',
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(18.h),
                  Text(
                    'A 4 - Digit PIN has been sent to your email address or mobile number, enter it below to continue',
                    style: Get.textTheme.bodyMedium!.copyWith(color: greyClr)
                  ),
                  Gap(35.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: PinCodeTextField(
                      controller: _pinCodeController,
                      validator: pinValidator,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      pinTheme: pinTheme(),
                      onCompleted: (v) {},
                      onChanged: (value) {},
                    ),
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
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Resend Code',
                          style:
                          Get.textTheme.titleMedium!.copyWith(color: orangeClr),
                        ),
                      ),
                    ],
                  ),
                  Gap(35.h),
                  isLoading == true?customCircularProgressIndicator: CustomElevatedButton(
                    onPressed: () {
                      _formOnSubmit();
                    },
                    buttonName: 'CONTINUE',
                    width: double.infinity.w,
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
