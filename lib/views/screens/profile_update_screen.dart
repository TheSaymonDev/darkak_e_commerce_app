import 'package:darkak_e_commerce_app/controllers/profile_update_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
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
  final String? id;
  final String? imgUrl;
  final String? name;
  final String? dob;
  final String? dom;
  final String? mobile;
  const ProfileUpdateScreen(
      {super.key,
      required this.id,
      required this.imgUrl,
      required this.name,
      required this.dob,
      required this.dom,
      required this.mobile});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final passwordController = TextEditingController();
  bool _isObscure = false;
  final ProfileUpdateController _profileUpdateController =
      Get.put(ProfileUpdateController());

  @override
  void initState() {
    super.initState();
    _profileUpdateController.nameController.text = widget.name!;
    _profileUpdateController.mobileNumberController.text = widget.mobile!;
    _profileUpdateController.passwordController.text = '***********';
    if (widget.dob != null) {
      _profileUpdateController.dateOfBirthController.text =
          formatDate(widget.dob!);
    } else {
      _profileUpdateController.dateOfBirthController.clear();
    }
    if (widget.dom != null) {
      _profileUpdateController.dateOfMarriageController.text =
          formatDate(widget.dom!);
    } else {
      _profileUpdateController.dateOfMarriageController.clear();
    }
  }

  String formatDate(String dobString) {
    try {
      final date = DateTime.parse(dobString);
      final formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(date);
    } catch (error) {
      // Handle parsing error (optional)
      print("Error parsing date: $error");
      return dobString; // Or return a default value
    }
  }

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
          child: Form(
            key: _profileUpdateController.formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _profileUpdateController.getImageFromGallery(),
                      child: SizedBox(
                          height: 120.h,
                          width: 120.w,
                          child: GetBuilder<ProfileUpdateController>(
                              builder: (controller) {
                            return CircleAvatar(
                              backgroundColor: orangeClr,
                              backgroundImage: controller.image != null
                                  ? FileImage(controller.image!)
                                  : widget.imgUrl != null
                                  ? NetworkImage('${Urls.imgUrl}${widget.imgUrl}')
                                  : const AssetImage( 'assets/images/profile-photo.png') as ImageProvider,
                            );
                          })),
                    ),
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
                  validator: Validators().nameValidator,
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
                        validator: Validators().dateValidator,
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
                                    DateFormat('yyyy-MM-dd')
                                        .format(selectedDate);
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
                        validator: Validators().dateValidator,
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
                                    DateFormat('yyyy-MM-dd')
                                        .format(selectedDate);
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
                  validator: Validators().passwordValidator,
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
                GetBuilder<ProfileUpdateController>(builder: (controller) {
                  return controller.isLoading == true
                      ? customCircularProgressIndicator
                      : CustomTwoButtons(
                          leftButtonName: 'Cancel',
                          rightButtonName: 'Save',
                          onLeftButtonPressed: () {
                            Get.back();
                          },
                          onRightButtonPressed: () {
                            controller.formOnSubmit(widget.id);
                          });
                }),
              ],
            ),
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
            validator: Validators().passwordValidator,
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
            validator: Validators().passwordValidator,
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
            validator: Validators().passwordValidator,
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
