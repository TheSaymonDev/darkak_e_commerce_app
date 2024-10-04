import 'package:darkak_e_commerce_app/screens/address_create_screen/models/create_address_model.dart';
import 'package:darkak_e_commerce_app/screens/address_update_screen/controllers/address_update_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/controllers/address_view_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressUpdateScreen extends StatelessWidget {
  AddressUpdateScreen({super.key});

  final _addressUpdateController = Get.find<AddressUpdateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Update Address',
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: _addressUpdateController.formKey,
              child: Column(
                children: [
                  Gap(16.h),
                  CustomTextFormField(
                      labelText: 'Full Name',
                      controller: _addressUpdateController.nameController,
                      validator: (value) => AppValidators().notEmptyValidator(
                          value, 'Please enter your full name')),
                  Gap(32.h),
                  CustomTextFormField(
                    labelText: 'Mobile',
                    controller: _addressUpdateController.mobileController,
                    keyBoardType: TextInputType.phone,
                    validator: AppValidators().mobileValidator,
                  ),
                  Gap(32.h),
                  CustomTextFormField(
                      labelText: 'Address',
                      controller: _addressUpdateController.addressController,
                      validator: (value) => AppValidators().notEmptyValidator(
                          value, 'Please enter your correct address')),
                  Gap(32.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            labelText: 'Area',
                            controller: _addressUpdateController.areaController,
                            validator: (value) => AppValidators()
                                .notEmptyValidator(value, 'Please enter area')),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: CustomTextFormField(
                            labelText: 'City',
                            controller: _addressUpdateController.cityController,
                            validator: (value) => AppValidators()
                                .notEmptyValidator(value, 'Please enter city')),
                      ),
                    ],
                  ),
                  Gap(32.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            labelText: 'Thana',
                            controller: _addressUpdateController.thanaController,
                            validator: (value) => AppValidators()
                                .notEmptyValidator(
                                    value, 'Please enter thana')),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: CustomTextFormField(
                            labelText: 'Zip Code',
                            controller: _addressUpdateController.zipCodeController,
                            keyBoardType: TextInputType.number,
                            validator: (value) => AppValidators()
                                .notEmptyValidator(
                                    value, 'Please enter zipcode')),
                      ),
                    ],
                  ),
                  Gap(32.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            labelText: 'State',
                            controller: _addressUpdateController.stateController,
                            validator: (value) => AppValidators()
                                .notEmptyValidator(
                                    value, 'Please enter state')),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Default Address',
                                style: Get.textTheme.bodyMedium),
                            GetBuilder<AddressUpdateController>(
                                builder: (controller) {
                              return CustomFlutterSwitch(
                                onToggle: (value) =>
                                    controller.toggleShippingAddress(value),
                                value: controller.shippingAddress,
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(48.h),
                  GetBuilder<AddressUpdateController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomTwoButtons(
                            leftButtonName: 'Cancel',
                            onLeftButtonPressed: () {
                              Get.back();
                            },
                            rightButtonName: 'Update',
                            onRightButtonPressed: () {
                              _formOnSubmitU(controller, context);
                            }),
                  ),
                  Gap(32.h),
                ],
              ),
            ),
          )),
    );
  }

  void _formOnSubmitU(AddressUpdateController controller, context) async {
    if (controller.formKey.currentState!.validate()) {
      final updateAddressModel = CreateAddressModel(
          fullName: controller.nameController.text,
          mobile: controller.mobileController.text.trim(),
          address: controller.addressController.text,
          area: controller.areaController.text,
          city: controller.cityController.text,
          thana: controller.thanaController.text,
          zip: controller.zipCodeController.text,
          state: controller.stateController.text,
          shippingAddress: controller.shippingAddress);
      bool result = await controller.updateAddress(
          id: controller.id, updateAddressData: updateAddressModel);
      if (result == true) {
        Get.find<AddressViewController>().getAddressList();
        Navigator.pop(context);
      }
    }
  }
}
