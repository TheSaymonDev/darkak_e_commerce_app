import 'package:darkak_e_commerce_app/screens/profile_update_screen/controllers/profile_update_controller.dart';
import 'package:darkak_e_commerce_app/screens/profile_update_screen/model/profile_update_model.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/screens/identity_verification_screen/identity_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({
    super.key,
  });

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final passwordController1 = TextEditingController();
  bool _isObscure = false;
  final _profileUpdateController = Get.find<ProfileUpdateController>();

  // @override
  // void initState() {
  //   super.initState();
  //   nameController.text = widget.name!;
  //   mobileNumberController.text = widget.mobile!;
  //   passwordController.text = '***********';
  //   if (widget.dob != null) {
  //     dateOfBirthController.text = formatDate(widget.dob!);
  //   } else {
  //     dateOfBirthController.clear();
  //   }
  //   if (widget.dom != null) {
  //     dateOfMarriageController.text = formatDate(widget.dom!);
  //   } else {
  //     dateOfMarriageController.clear();
  //   }
  // }

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
                _buildImage,
                Gap(64.h),
                CustomTextFormField(
                  labelText: 'Full Name',
                  controller: _profileUpdateController.nameController,
                  validator: AppValidators().nameValidator,
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
                        validator: AppValidators().dobValidator,
                        suffixIcon: IconButton(
                            onPressed: () {
                              dateSelection(_profileUpdateController
                                  .dateOfBirthController);
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
                        validator: (value) => AppValidators().domValidator(
                            value!,
                            DateTime.parse(_profileUpdateController
                                .dateOfBirthController.text
                                .trim())),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              dateSelection(_profileUpdateController
                                  .dateOfMarriageController);
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
                  validator: AppValidators().passwordValidator,
                  readOnly: true,
                  obscureText: true,
                ),
                Gap(16.h),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      //_showBottomSheet();
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
                          onRightButtonPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              await controller.updateProfile(
                                profileUpdateData: ProfileUpdateModel(
                                    name: controller.nameController.text,
                                    dob: controller.dateOfBirthController.text
                                        .trim(),
                                    marriageDate: controller
                                        .dateOfMarriageController.text
                                        .trim()),
                                id: controller.id,
                              );
                            }
                          });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack get _buildImage {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => _profileUpdateController.getImageFromGallery(),
          child: SizedBox(
              height: 120.h,
              width: 120.w,
              child: GetBuilder<ProfileUpdateController>(builder: (controller) {
                return CircleAvatar(
                    backgroundColor: orangeClr,
                    backgroundImage: controller.imageFile != null
                        ? FileImage(controller.imageFile!)
                        : _profileUpdateController.imgUrl != null
                            ? NetworkImage(
                                '${AppUrls.imgUrl}${_profileUpdateController.imgUrl}')
                            : const AssetImage(
                                    'assets/images/profile-photo.png')
                                as ImageProvider);
              })),
        ),
        Positioned(
            right: 8,
            top: 8,
            child: CircleAvatar(
                radius: 15.r,
                backgroundColor: whiteClr,
                child: Icon(Icons.camera_alt_outlined,
                    size: 20.sp, color: blackClr))),
      ],
    );
  }

  void dateSelection(TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2023, 12, 31),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      // Update your controller with the selected date
      controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  // Future<dynamic> _showBottomSheet() {
  //   return Get.bottomSheet(
  //     CustomBottomSheet(
  //       children: [
  //         Text(
  //           'Change password',
  //           style: myStyle(30.sp, FontWeight.bold, blackClr),
  //         ),
  //         Gap(50.h),
  //         CustomTextFormField(
  //           labelText: 'Old Password',
  //           controller: passwordController,
  //           validator: AppValidators().passwordValidator,
  //           suffixIcon: Padding(
  //             padding: EdgeInsets.only(right: 8.w),
  //             child: IconButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     _isObscure = !_isObscure;
  //                   });
  //                 },
  //                 icon: Icon(
  //                   _isObscure ? Icons.visibility_off : Icons.visibility,
  //                   color: blackClr,
  //                   size: 25.sp,
  //                 )),
  //           ),
  //           obscureText: _isObscure,
  //         ),
  //         Gap(8.h),
  //         Align(
  //           alignment: Alignment.topRight,
  //           child: GestureDetector(
  //             onTap: () {
  //               Get.to(() => IdentityVerificationScreen());
  //             },
  //             child: Text(
  //               'Forgot Password?',
  //               style: myStyle(20.sp, FontWeight.bold, orangeClr),
  //             ),
  //           ),
  //         ),
  //         Gap(30.h),
  //         CustomTextFormField(
  //           labelText: 'New Password',
  //           controller: passwordController,
  //           validator: AppValidators().passwordValidator,
  //           readOnly: true,
  //           suffixIcon: Padding(
  //             padding: EdgeInsets.only(right: 8.w),
  //             child: IconButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     _isObscure = !_isObscure;
  //                   });
  //                 },
  //                 icon: Icon(
  //                   _isObscure ? Icons.visibility_off : Icons.visibility,
  //                   color: blackClr,
  //                   size: 25.sp,
  //                 )),
  //           ),
  //           obscureText: _isObscure,
  //         ),
  //         Gap(35.h),
  //         CustomTextFormField(
  //           labelText: 'Confirm Password',
  //           controller: passwordController,
  //           validator: AppValidators().passwordValidator,
  //           readOnly: true,
  //           suffixIcon: Padding(
  //             padding: EdgeInsets.only(right: 8.w),
  //             child: IconButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     _isObscure = !_isObscure;
  //                   });
  //                 },
  //                 icon: Icon(
  //                   _isObscure ? Icons.visibility_off : Icons.visibility,
  //                   color: blackClr,
  //                   size: 25.sp,
  //                 )),
  //           ),
  //           obscureText: _isObscure,
  //         ),
  //         Gap(40.h),
  //         CustomElevatedButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             buttonName: 'Change Password',
  //             width: double.infinity.w),
  //         Gap(32.h)
  //       ],
  //     ),
  //   );
  // }
}
