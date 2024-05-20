import 'package:darkak_e_commerce_app/screens/address_management_screen/controller/address_update_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/controller/address_view_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_management_screen/controller/create_address_controller.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/model/address.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_validator.dart';
import 'package:darkak_e_commerce_app/screens/address_management_screen/model/create_address_model.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressManagementScreen extends StatefulWidget {
  final String title;
  final Address? shippingAddress;
  const AddressManagementScreen(
      {super.key, required this.title, this.shippingAddress});

  @override
  State<AddressManagementScreen> createState() => _AddressManagementScreenState();
}

class _AddressManagementScreenState extends State<AddressManagementScreen> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _areaController = TextEditingController();
  final _cityController = TextEditingController();
  final _thanaController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _stateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _thanaController.dispose();
    _cityController.dispose();
    _areaController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.shippingAddress != null) {
      _nameController.text = widget.shippingAddress!.fullName ?? '';
      _mobileController.text = widget.shippingAddress!.mobile ?? '';
      _addressController.text = widget.shippingAddress!.address ?? '';
      _areaController.text = widget.shippingAddress!.area ?? '';
      _cityController.text = widget.shippingAddress!.city ?? '';
      _thanaController.text = widget.shippingAddress!.thana ?? '';
      _zipCodeController.text = widget.shippingAddress!.zip ?? '';
      _thanaController.text = widget.shippingAddress!.thana ?? '';
      _stateController.text = widget.shippingAddress!.state ?? '';
      Get.find<AddressUpdateController>().shippingAddress =
          widget.shippingAddress!.shippingAddress!;
    } else {
      print('=======================null');
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
        title: widget.title,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: widget.title == 'Update Address'
            ? SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Gap(16.h),
                      CustomTextFormField(
                          labelText: 'Full Name',
                          controller: _nameController,
                          validator: (value) => AppValidators().notEmptyValidator(
                              value, 'Please enter your full name')),
                      Gap(32.h),
                      CustomTextFormField(
                        labelText: 'Mobile',
                        controller: _mobileController,
                        keyBoardType: TextInputType.phone,
                        validator: AppValidators().mobileValidator,
                      ),
                      Gap(32.h),
                      CustomTextFormField(
                          labelText: 'Address',
                          controller: _addressController,
                          validator: (value) => AppValidators().notEmptyValidator(
                              value, 'Please enter your correct address')),
                      Gap(32.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Area',
                                controller: _areaController,
                                validator: (value) => AppValidators()
                                    .notEmptyValidator(
                                        value, 'Please enter area')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'City',
                                controller: _cityController,
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
                                controller: _thanaController,
                                validator: (value) => AppValidators()
                                    .notEmptyValidator(
                                        value, 'Please enter thana')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Zip Code',
                                controller: _zipCodeController,
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
                                controller: _stateController,
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
              )
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Gap(16.h),
                      CustomTextFormField(
                          labelText: 'Full Name',
                          controller: _nameController,
                          validator: (value) => AppValidators().notEmptyValidator(
                              value, 'Please enter your full name')),
                      Gap(32.h),
                      CustomTextFormField(
                        labelText: 'Mobile',
                        controller: _mobileController,
                        keyBoardType: TextInputType.phone,
                        validator: AppValidators().mobileValidator,
                      ),
                      Gap(32.h),
                      CustomTextFormField(
                          labelText: 'Address',
                          controller: _addressController,
                          validator: (value) => AppValidators().notEmptyValidator(
                              value, 'Please enter your correct address')),
                      Gap(32.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Area',
                                controller: _areaController,
                                validator: (value) => AppValidators()
                                    .notEmptyValidator(
                                        value, 'Please enter area')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'City',
                                controller: _cityController,
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
                                controller: _thanaController,
                                validator: (value) => AppValidators()
                                    .notEmptyValidator(
                                        value, 'Please enter thana')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Zip Code',
                                controller: _zipCodeController,
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
                                controller: _stateController,
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
    if (_formKey.currentState?.validate() ?? false) {
      final createAddressModel = CreateAddress(
          fullName: _nameController.text.trim(),
          mobile: _mobileController.text.trim(),
          address: _addressController.text.trim(),
          area: _areaController.text.trim(),
          city: _cityController.text.trim(),
          thana: _thanaController.text.trim(),
          zip: _zipCodeController.text.trim(),
          state: _stateController.text.trim(),
          shippingAddress: controller.shippingAddress);
      bool result =
          await controller.addAddress(createAddress: createAddressModel);
      if (result == true) {
        Get.find<AddressViewController>().getAddressList();
        Navigator.pop(context);
      }
    }
  }

  void _formOnSubmitU(AddressUpdateController controller, context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final updateAddressModel = CreateAddress(
          fullName: _nameController.text.trim(),
          mobile: _mobileController.text.trim(),
          address: _addressController.text.trim(),
          area: _areaController.text.trim(),
          city: _cityController.text.trim(),
          thana: _thanaController.text.trim(),
          zip: _zipCodeController.text.trim(),
          state: _stateController.text.trim(),
          shippingAddress: controller.shippingAddress);
      bool result = await controller.updateAddress(
          id: widget.shippingAddress!.id!,
          updateAddress: updateAddressModel);
      if (result == true) {
        Get.find<AddressViewController>().getAddressList();
        Navigator.pop(context);
      }
    }
  }
}
