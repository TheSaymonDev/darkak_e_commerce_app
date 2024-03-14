import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/models/address_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/address_screen/address_view_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_dropdown_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressEditableScreen extends StatefulWidget {
  const AddressEditableScreen({super.key, required this.title});

  final String title;

  @override
  State<AddressEditableScreen> createState() => _AddressEditableScreenState();
}

class _AddressEditableScreenState extends State<AddressEditableScreen> {
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _zipCodeController = TextEditingController();

  final List<String> _divisionList = ['Dhaka', 'Chittagong'];
  String? _selectedDivision;

  final List<String> _districtList = ['Cumilla', 'Feni'];
  String? _selectedDistrict;

  final List<String> _subDistrictList = ['Chandina', 'Devidwar'];
  String? _selectedSubDistrict;

  bool _isDefaultAddress = false;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(16.h),
              CustomTextFormField(
                  labelText: 'Address Line 1',
                  controller: _addressLine1Controller),
              Gap(35.h),
              CustomTextFormField(
                  labelText: 'Address Line 2',
                  controller: _addressLine2Controller),
              Gap(35.h),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdownButton(
                        items: _divisionList,
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
                        onChanged: (newValue) {
                          setState(() {
                            _selectedSubDistrict = newValue;
                          });
                        },
                        labelText: 'Subdistrict'),
                  ),
                  Gap(32.w),
                  Expanded(
                      child: CustomTextFormField(
                    labelText: 'Zip Code',
                    controller: _zipCodeController,
                    keyBoardType: TextInputType.number,
                  ))
                ],
              ),
              Gap(35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Default Address',
                    style: myStyle(25.sp, FontWeight.normal, blackClr),
                  ),
                  CustomFlutterSwitch(
                    onToggle: (value) {
                      setState(() {
                        _isDefaultAddress = value;
                      });
                    },
                    value: _isDefaultAddress,
                  ),
                ],
              ),
              Gap(48.h),
              CustomTwoButtons(
                  leftButtonName: 'Cancel',
                  onLeftButtonPressed: () {
                    Get.back();
                  },
                  rightButtonName: 'Save',
                  onRightButtonPressed: () {
                    AddressModel newAddress = AddressModel(
                        addressLine1: _addressLine1Controller.text,
                        addressLine2: _addressLine2Controller.text,
                        division: _selectedDivision.toString(),
                        district: _selectedDistrict.toString(),
                        subDistrict: _selectedSubDistrict.toString(),
                        zipCode: _zipCodeController.text);
                    AddressModel.addAddress(newAddress);
                    setState(() {
                    });
                    Get.to(()=>const AddressViewScreen());
                  }),
              Gap(32.h),
            ],
          ),
        ),
      ),
    );
  }
}
