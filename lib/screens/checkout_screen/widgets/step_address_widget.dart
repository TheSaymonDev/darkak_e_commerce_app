import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_address_controller.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StepAddressWidget extends StatefulWidget {
  const StepAddressWidget({super.key});

  @override
  State<StepAddressWidget> createState() => _StepAddressWidgetState();
}

class _StepAddressWidgetState extends State<StepAddressWidget> {



  final  _stepAddressController = Get.find<StepAddressController>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            labelText: 'Full Name',
            controller: _stepAddressController.nameController,
            readOnly: true
        ),
        Gap(32.h),
        CustomTextFormField(
            labelText: 'Mobile',
            controller: _stepAddressController.mobileController,
            keyBoardType: TextInputType.phone,
            readOnly: true
        ),
        Gap(32.h),
        CustomTextFormField(
            labelText: 'Address',
            controller: _stepAddressController.addressController,
            readOnly: true),
        Gap(32.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  labelText: 'Area',
                  controller: _stepAddressController.areaController,
                  readOnly: true),
            ),
            Gap(16.w),
            Expanded(
              child: CustomTextFormField(
                  labelText: 'City',
                  controller: _stepAddressController.cityController,
                  readOnly: true),
            ),
          ],
        ),
        Gap(32.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  labelText: 'Thana',
                  controller: _stepAddressController.thanaController,
                  readOnly: true),
            ),
            Gap(16.w),
            Expanded(
              child: CustomTextFormField(
                  labelText: 'Zip Code',
                  controller: _stepAddressController.zipCodeController,
                  readOnly: true),
            ),
          ],
        ),
        Gap(32.h),
        CustomTextFormField(
            labelText: 'State',
            controller: _stepAddressController.stateController,
            readOnly: true),
      ],
    );
  }
}