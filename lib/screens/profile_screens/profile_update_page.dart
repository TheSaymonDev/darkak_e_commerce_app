import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/validator.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/screens/authentication_screens/verify_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final _nameController = TextEditingController();

  final _dateOfBirthController = TextEditingController();

  final _dateOfMarriageController = TextEditingController();

  final _mobileNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: CircleAvatar(
                        backgroundColor: orangeColor,
                        backgroundImage: const AssetImage(
                          'assets/images/profile-photo.png',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: backgroundColor,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 20.sp,
                            color: textColor,
                          ))),
                ],
              ),
              Gap(64.h),
              CustomTextFormField(
                labelText: 'Full Name',
                controller: _nameController,
                validator: nameValidator,
              ),
              Gap(35.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Date of Birth',
                      controller: _dateOfBirthController,
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
                              _dateOfBirthController.text =
                                  DateFormat('dd/MM/yyyy').format(selectedDate);
                            }
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            size: 20.sp,
                            color: orangeColor,
                          )),
                    ),
                  ),
                  Gap(40.w),
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Date of Marriage',
                      controller: _dateOfMarriageController,
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
                              _dateOfMarriageController.text =
                                  DateFormat('dd/MM/yyyy').format(selectedDate);
                            }
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            size: 20.sp,
                            color: orangeColor,
                          )),
                    ),
                  ),
                ],
              ),
              Gap(35.h),
              CustomTextFormField(
                labelText: 'Mobile Number',
                controller: _mobileNumberController,
                keyBoardType: TextInputType.number,
              ),
              Gap(35.h),
              CustomTextFormField(
                labelText: 'Password',
                controller: _passwordController,
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
                    style: myTextStyle(20.sp, FontWeight.bold, orangeColor),
                  ),
                ),
              ),
              Gap(40.h),
              CustomTwoButtons(
                  leftButtonName: 'Cancel',
                  rightButtonName: 'Save',
                  onLeftButtonPressed: () {
                    Get.back();
                  },
                  onRightButtonPressed: () {
                    Get.back();
                  })
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
            style: myTextStyle(30.sp, FontWeight.bold, textColor),
          ),
          Gap(50.h),
          CustomTextFormField(
            labelText: 'Old Password',
            controller: _passwordController,
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
                    color: textColor,
                    size: 25.sp,
                  )),
            ),
            obscureText: _isObscure,
          ),
          Gap(8.h),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: (){
                Get.to(()=>VerifyEmailPage());
              },
              child: Text(
                'Forgot Password?',
                style: myTextStyle(20.sp, FontWeight.bold, orangeColor),
              ),
            ),
          ),
          Gap(30.h),
          CustomTextFormField(
            labelText: 'New Password',
            controller: _passwordController,
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
                    color: textColor,
                    size: 25.sp,
                  )),
            ),
            obscureText: _isObscure,
          ),
          Gap(35.h),
          CustomTextFormField(
            labelText: 'Confirm Password',
            controller: _passwordController,
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
                    color: textColor,
                    size: 25.sp,
                  )),
            ),
            obscureText: _isObscure,
          ),
          Gap(40.h),
          CustomOrangeButton(
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

  void _getDateFromUser(BuildContext context) async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2001),
        lastDate: DateTime(2024));

    if (pickerDate != null) {
      setState(() {
        String formattedDate = DateFormat('dd/MM/yyyy').format(pickerDate);
        print("Dte $formattedDate");
        _dateOfMarriageController.text = formattedDate;
      });
    } else {
      print('it is null or something is wrong');
    }
  }
}
