import 'package:darkak_e_commerce_app/screens/checkout_screens/controller/step_address_controller.dart';
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

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final thanaController = TextEditingController();
  final zipCodeController = TextEditingController();
  final stateController = TextEditingController();

  final StepAddressController _stepAddressController = Get.find<StepAddressController>();

  @override
  void initState() {
    super.initState();
    nameController.text = _stepAddressController.readAddressModel!.fullName!;
    mobileController.text = _stepAddressController.readAddressModel!.mobile!;
    addressController.text = _stepAddressController.readAddressModel!.address!;
    areaController.text = _stepAddressController.readAddressModel!.area!;
    cityController.text = _stepAddressController.readAddressModel!.city!;
    thanaController.text = _stepAddressController.readAddressModel!.thana!;
    zipCodeController.text = _stepAddressController.readAddressModel!.zip!;
    stateController.text = _stepAddressController.readAddressModel!.state!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            labelText: 'Full Name',
            controller: nameController,
            readOnly: true
        ),
        Gap(32.h),
        CustomTextFormField(
            labelText: 'Mobile',
            controller: mobileController,
            keyBoardType: TextInputType.phone,
            readOnly: true
        ),
        Gap(32.h),
        CustomTextFormField(
            labelText: 'Address',
            controller: addressController,
            readOnly: true),
        Gap(32.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  labelText: 'Area',
                  controller: areaController,
                  readOnly: true),
            ),
            Gap(16.w),
            Expanded(
              child: CustomTextFormField(
                  labelText: 'City',
                  controller: cityController,
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
                  controller: thanaController,
                  readOnly: true),
            ),
            Gap(16.w),
            Expanded(
              child: CustomTextFormField(
                  labelText: 'Zip Code',
                  controller: zipCodeController,
                  readOnly: true),
            ),
          ],
        ),
        Gap(32.h),
        CustomTextFormField(
            labelText: 'State',
            controller: stateController,
            readOnly: true),
      ],
    );
  }
}
