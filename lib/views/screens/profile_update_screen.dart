import 'package:darkak_e_commerce_app/controllers/profile_update_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/email_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {

  final passwordController = TextEditingController();
  bool _isObscure = false;
  final ProfileUpdateController _profileUpdateController =
      Get.find<ProfileUpdateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Edit Profile',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  GetBuilder<ProfileUpdateController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () => controller.getImage(),
                      child: SizedBox(
                        height: 120.h,
                        width: 120.w,
                        child: CircleAvatar(
                          backgroundColor: orangeClr,
                          backgroundImage: (controller.image == null)
                              ? const AssetImage('assets/images/profile-photo.png')
                              : FileImage(controller.image!) as ImageProvider,
                        )
                      ),
                    );
                  }),
                  Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: whiteClr,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 20.sp,
                            color: blackClr,
                          ))),
                ],
              ),
              Gap(64.h),
              CustomTextFormField(
                labelText: 'Full Name',
                controller: _profileUpdateController.nameController,
                validator: nameValidator,
              ),
              Gap(35.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Date of Birth',
                      controller:
                          _profileUpdateController.dateOfBirthController,
                      readOnly: true,
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2024, 12, 31),
                            );
                            if (selectedDate != null) {
                              // Update your controller with the selected date
                              _profileUpdateController
                                      .dateOfBirthController.text =
                                  DateFormat('dd/MM/yyyy').format(selectedDate);
                            }
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            size: 20.sp,
                            color: orangeClr,
                          )),
                    ),
                  ),
                  Gap(40.w),
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Date of Marriage',
                      controller:
                          _profileUpdateController.dateOfMarriageController,
                      readOnly: true,
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2024, 12, 31),
                            );
                            if (selectedDate != null) {
                              // Update your controller with the selected date
                              _profileUpdateController
                                      .dateOfMarriageController.text =
                                  DateFormat('dd/MM/yyyy').format(selectedDate);
                            }
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            size: 20.sp,
                            color: orangeClr,
                          )),
                    ),
                  ),
                ],
              ),
              Gap(35.h),
              CustomTextFormField(
                labelText: 'Mobile Number',
                controller: _profileUpdateController.mobileNumberController,
                keyBoardType: TextInputType.phone,
                readOnly: true,
              ),
              Gap(35.h),
              CustomTextFormField(
                labelText: 'Password',
                controller: _profileUpdateController.passwordController,
                validator: passwordValidator,
                readOnly: true,
                obscureText: true,
              ),
              Gap(16.h),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    _showBottomSheet();
                  },
                  child: Text(
                    'Change password?',
                    style: myStyle(20.sp, FontWeight.bold, orangeClr),
                  ),
                ),
              ),
              Gap(40.h),
              GetBuilder<ProfileUpdateController>(
                builder: (controller) => controller.isLoading == true
                    ? customCircularProgressIndicator
                    : CustomTwoButtons(
                        leftButtonName: 'Cancel',
                        rightButtonName: 'Save',
                        onLeftButtonPressed: () {
                          Get.back();
                        },
                        onRightButtonPressed: () {
                          controller.formOnSubmit();
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheet() {
    return Get.bottomSheet(
      CustomBottomSheet(
        children: [
          Text(
            'Change password',
            style: myStyle(30.sp, FontWeight.bold, blackClr),
          ),
          Gap(50.h),
          CustomTextFormField(
            labelText: 'Old Password',
            controller: passwordController,
            validator: passwordValidator,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: blackClr,
                    size: 25.sp,
                  )),
            ),
            obscureText: _isObscure,
          ),
          Gap(8.h),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Get.to(() => EmailVerificationScreen());
              },
              child: Text(
                'Forgot Password?',
                style: myStyle(20.sp, FontWeight.bold, orangeClr),
              ),
            ),
          ),
          Gap(30.h),
          CustomTextFormField(
            labelText: 'New Password',
            controller: passwordController,
            validator: passwordValidator,
            readOnly: true,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: blackClr,
                    size: 25.sp,
                  )),
            ),
            obscureText: _isObscure,
          ),
          Gap(35.h),
          CustomTextFormField(
            labelText: 'Confirm Password',
            controller: passwordController,
            validator: passwordValidator,
            readOnly: true,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: blackClr,
                    size: 25.sp,
                  )),
            ),
            obscureText: _isObscure,
          ),
          Gap(40.h),
          CustomElevatedButton(
              onPressed: () {
                Get.back();
              },
              buttonName: 'Change Password',
              width: double.infinity.w),
          Gap(32.h)
        ],
      ),
    );
  }

}
