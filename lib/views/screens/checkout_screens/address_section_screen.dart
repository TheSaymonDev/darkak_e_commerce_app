import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_dropdown_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressSectionScreen extends StatefulWidget {
  const AddressSectionScreen({super.key});

  @override
  State<AddressSectionScreen> createState() => _AddressSectionScreenState();
}

class _AddressSectionScreenState extends State<AddressSectionScreen> {
  List<String> addressList = ['Address 1', 'Address 2', 'Address 3'];
  String? selectedAddress;

  final List<String> _divisionList = ['Dhaka', 'Chittagong'];
  final List<String> _districtList = ['Cumilla', 'Feni'];
  final List<String> _subDistrictList = ['Chandina', 'Devidwar'];

  final CheckOutScreenController _checkOutScreenController = Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _checkOutScreenController.formKey,
      child: Column(
        children: [
          CustomDropdownButton(
              items: addressList,
              onChanged: (newValue) {
                setState(() {
                  selectedAddress = newValue;
                });
              },
              labelText: 'Default Address'),
          Gap(40.h),
          CustomTextFormField(
            labelText: 'Address Line 1',
            controller: _checkOutScreenController.addressLine1Controller,
            validator: Validators().addressLine1Validator,
          ),
          Gap(35.h),
          CustomTextFormField(
              labelText: 'Address Line 2',
              controller: _checkOutScreenController.addressLine2Controller),
          Gap(35.h),
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton(
                    items: _divisionList,
                    validator: Validators().dropdownValidator,
                    onChanged: (newValue) {
                      setState(() {
                        _checkOutScreenController.selectedDivision = newValue;
                      });
                    },
                    labelText: 'Division'),
              ),
              Gap(32.w),
              Expanded(
                child: CustomDropdownButton(
                    items: _districtList,
                    validator: Validators().dropdownValidator,
                    onChanged: (newValue) {
                      _checkOutScreenController.selectedDistrict = newValue;
                    },
                    labelText: 'District'),
              ),
            ],
          ),
          Gap(35.h),
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton(
                    items: _subDistrictList,
                    validator: Validators().dropdownValidator,
                    onChanged: (newValue) {
                      setState(() {
                        _checkOutScreenController.selectedSubDistrict =
                            newValue;
                      });
                    },
                    labelText: 'Sub-District'),
              ),
              Gap(32.w),
              Expanded(
                  child: CustomTextFormField(
                labelText: 'Zip Code',
                controller: _checkOutScreenController.zipCodeController,
                keyBoardType: TextInputType.number,
                validator: Validators().zipCodeValidator,
              ))
            ],
          ),
        ],
      ),
    );
  }
}
