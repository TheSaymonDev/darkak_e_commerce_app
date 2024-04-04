import 'package:darkak_e_commerce_app/controllers/address_update_controller.dart';
import 'package:darkak_e_commerce_app/controllers/address_view_controller.dart';
import 'package:darkak_e_commerce_app/controllers/create_address_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/models/create_address_model.dart';
import 'package:darkak_e_commerce_app/models/read_address_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressEditableScreen extends StatefulWidget {
  final String title;
  final ReadAddressModel? readAddressModel;
  const AddressEditableScreen(
      {super.key, required this.title, this.readAddressModel});

  @override
  State<AddressEditableScreen> createState() => _AddressEditableScreenState();
}

class _AddressEditableScreenState extends State<AddressEditableScreen> {
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
    if (widget.readAddressModel != null) {
      _nameController.text = widget.readAddressModel!.fullName ?? '';
      _mobileController.text = widget.readAddressModel!.mobile ?? '';
      _addressController.text = widget.readAddressModel!.address ?? '';
      _areaController.text = widget.readAddressModel!.area ?? '';
      _cityController.text = widget.readAddressModel!.city ?? '';
      _thanaController.text = widget.readAddressModel!.thana ?? '';
      _zipCodeController.text = widget.readAddressModel!.zip ?? '';
      _thanaController.text = widget.readAddressModel!.thana ?? '';
      _stateController.text = widget.readAddressModel!.state ?? '';
      Get.find<AddressUpdateController>().shippingAddress =
          widget.readAddressModel!.shippingAddress!;
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
                          validator: (value) => Validators().notEmptyValidator(
                              value, 'Please enter your full name')),
                      Gap(32.h),
                      CustomTextFormField(
                        labelText: 'Mobile',
                        controller: _mobileController,
                        keyBoardType: TextInputType.phone,
                        validator: Validators().mobileValidator,
                      ),
                      Gap(32.h),
                      CustomTextFormField(
                          labelText: 'Address',
                          controller: _addressController,
                          validator: (value) => Validators().notEmptyValidator(
                              value, 'Please enter your correct address')),
                      Gap(32.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Area',
                                controller: _areaController,
                                validator: (value) => Validators()
                                    .notEmptyValidator(
                                        value, 'Please enter area')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'City',
                                controller: _cityController,
                                validator: (value) => Validators()
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
                                validator: (value) => Validators()
                                    .notEmptyValidator(
                                        value, 'Please enter thana')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Zip Code',
                                controller: _zipCodeController,
                                keyBoardType: TextInputType.number,
                                validator: (value) => Validators()
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
                                validator: (value) => Validators()
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
                          validator: (value) => Validators().notEmptyValidator(
                              value, 'Please enter your full name')),
                      Gap(32.h),
                      CustomTextFormField(
                        labelText: 'Mobile',
                        controller: _mobileController,
                        keyBoardType: TextInputType.phone,
                        validator: Validators().mobileValidator,
                      ),
                      Gap(32.h),
                      CustomTextFormField(
                          labelText: 'Address',
                          controller: _addressController,
                          validator: (value) => Validators().notEmptyValidator(
                              value, 'Please enter your correct address')),
                      Gap(32.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Area',
                                controller: _areaController,
                                validator: (value) => Validators()
                                    .notEmptyValidator(
                                        value, 'Please enter area')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'City',
                                controller: _cityController,
                                validator: (value) => Validators()
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
                                validator: (value) => Validators()
                                    .notEmptyValidator(
                                        value, 'Please enter thana')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                labelText: 'Zip Code',
                                controller: _zipCodeController,
                                keyBoardType: TextInputType.number,
                                validator: (value) => Validators()
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
                                validator: (value) => Validators()
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
      final createAddressModel = CreateAddressModel(
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
          await controller.formOnSubmit(createAddressModel: createAddressModel);
      if (result == true) {
        Get.find<AddressViewController>().getAddressList();
        Navigator.pop(context);
      }
    }
  }

  void _formOnSubmitU(AddressUpdateController controller, context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final updateAddressModel = CreateAddressModel(
          fullName: _nameController.text.trim(),
          mobile: _mobileController.text.trim(),
          address: _addressController.text.trim(),
          area: _areaController.text.trim(),
          city: _cityController.text.trim(),
          thana: _thanaController.text.trim(),
          zip: _zipCodeController.text.trim(),
          state: _stateController.text.trim(),
          shippingAddress: controller.shippingAddress);
      bool result = await controller.formOnSubmit(
          id: widget.readAddressModel!.id!,
          updateAddressModel: updateAddressModel);
      if (result == true) {
        Get.find<AddressViewController>().getAddressList();
        Navigator.pop(context);
      }
    }
  }
}
