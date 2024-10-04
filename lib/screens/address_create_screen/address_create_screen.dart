import 'package:darkak_e_commerce_app/screens/address_create_screen/controllers/create_address_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_create_screen/models/create_address_model.dart';
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

class AddressCreateScreen extends StatelessWidget {
  AddressCreateScreen({super.key});

  final _addressCreateController = Get.find<CreateAddressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Create Address',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _addressCreateController.formKey,
            child: Column(
              children: [
                Gap(16.h),
                CustomTextFormField(
                    labelText: 'Full Name',
                    controller: _addressCreateController.nameController,
                    validator: (value) => AppValidators().notEmptyValidator(
                        value, 'Please enter your full name')),
                Gap(32.h),
                CustomTextFormField(
                  labelText: 'Mobile',
                  controller: _addressCreateController.mobileController,
                  keyBoardType: TextInputType.phone,
                  validator: AppValidators().mobileValidator,
                ),
                Gap(32.h),
                CustomTextFormField(
                    labelText: 'Address',
                    controller: _addressCreateController.addressController,
                    validator: (value) => AppValidators().notEmptyValidator(
                        value, 'Please enter your correct address')),
                Gap(32.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          labelText: 'Area',
                          controller: _addressCreateController.areaController,
                          validator: (value) => AppValidators()
                              .notEmptyValidator(
                              value, 'Please enter area')),
                    ),
                    Gap(16.w),
                    Expanded(
                      child: CustomTextFormField(
                          labelText: 'City',
                          controller: _addressCreateController.cityController,
                          validator: (value) => AppValidators()
                              .notEmptyValidator(
                              value, 'Please enter city')),
                    ),
                  ],
                ),
                Gap(32.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          labelText: 'Thana',
                          controller: _addressCreateController.thanaController,
                          validator: (value) => AppValidators()
                              .notEmptyValidator(
                              value, 'Please enter thana')),
                    ),
                    Gap(16.w),
                    Expanded(
                      child: CustomTextFormField(
                          labelText: 'Zip Code',
                          controller: _addressCreateController.zipCodeController,
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
                          controller: _addressCreateController.stateController,
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
                          GetBuilder<CreateAddressController>(
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
                GetBuilder<CreateAddressController>(
                  builder: (controller) => controller.isLoading
                      ? customCircularProgressIndicator
                      : CustomTwoButtons(
                      leftButtonName: 'Cancel',
                      onLeftButtonPressed: () {
                        Get.back();
                      },
                      rightButtonName: 'Save',
                      onRightButtonPressed: () {
                        _formOnSubmitC(controller, context);
                      }),
                ),
                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmitC(CreateAddressController controller, context) async {
    if (controller.formKey.currentState!.validate()) {
      final createAddressModel = CreateAddressModel(
          fullName: controller.nameController.text,
          mobile: controller.mobileController.text.trim(),
          address: controller.addressController.text,
          area: controller.areaController.text,
          city: controller.cityController.text,
          thana: controller.thanaController.text,
          zip: controller.zipCodeController.text,
          state: controller.stateController.text,
          shippingAddress: controller.shippingAddress);
      bool result =
      await controller.addAddress(createAddressData: createAddressModel);
      if (result) {
        Get.find<AddressViewController>().getAddressList();
        Navigator.pop(context);
      }
    }
  }

}
