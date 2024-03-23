import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
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

  final _zipCodeController = TextEditingController();

  final List<String> _divisionList = ['Dhaka', 'Chittagong'];
  String? _selectedDivision;

  final List<String> _districtList = ['Cumilla', 'Feni'];
  String? _selectedDistrict;

  final List<String> _subDistrictList = ['Chandina', 'Devidwar'];
  String? _selectedSubDistrict;

  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
            controller: _addressLine1Controller,
            validator: (value) {
              if (value != null) {
                'Please Enter Your Address';
              }
              return null;
            },
          ),
          Gap(35.h),
          CustomTextFormField(
              labelText: 'Address Line 2', controller: _addressLine2Controller),
          Gap(35.h),
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton(
                    items: _divisionList,
                    validator: (value) {
                      if (value != null) {
                        'Please Select Division';
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDivision = newValue;
                      });
                    },
                    labelText: 'Division'),
              ),
              Gap(32.w),
              Expanded(
                child: CustomDropdownButton(
                    items: _districtList,
                    validator: (value) {
                      if (value != null) {
                        'Please Select District';
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      _selectedDistrict = newValue;
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
                    validator: (value) {
                      if (value != null) {
                        'Please Select Sub-District';
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSubDistrict = newValue;
                      });
                    },
                    labelText: 'Sub-District'),
              ),
              Gap(32.w),
              Expanded(
                  child: CustomTextFormField(
                labelText: 'Zip Code',
                controller: _zipCodeController,
                keyBoardType: TextInputType.number,
                validator: (value) {
                  if (value != null) {
                    'Please Enter Zipcode';
                  }
                  return null;
                },
              ))
            ],
          ),
        ],
      ),
    );
  }
}
