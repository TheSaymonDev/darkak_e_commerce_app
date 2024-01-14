import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_edit_delete_buttons.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _areaController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Shipping Address',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            Gap(32.h),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        width: double.infinity.w,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Home Address',
                                  style: myTextStyle(
                                      25.sp, FontWeight.bold, textColor),
                                ),
                                CustomEditDeleteButtons(
                                    isEditable: true, onTap: () {}),
                              ],
                            ),
                            Gap(8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dhaka, Dhaka North,\nBanani Road No. 12 - 19',
                                  style: myTextStyle(
                                      20.sp, FontWeight.normal, textColor),
                                ),
                                CustomEditDeleteButtons(
                                    isEditable: false, onTap: () {}),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {
                                    setState(() {
                                      // _isCheckedBilling = !_isCheckedBilling;
                                    });
                                  },
                                  activeColor: orangeColor,
                                ),
                                Text(
                                  'Use as the shipping address',
                                  style: myTextStyle(
                                      20.sp, FontWeight.normal, textColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => Gap(48.h),
                  itemCount: 2),
            ),
            CustomOrangeButton(
                onPressed: () {
                  _showBottomSheet();
                },
                buttonName: 'Add New',
                width: double.infinity.w),
            Gap(32.h),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheet() {
    return Get.bottomSheet(
      CustomBottomSheet(
        children: [
          Text(
            'Shipping Address',
            style: myTextStyle(25.sp, FontWeight.bold, textColor),
          ),
          Gap(40.h),
          CustomTextFormField(
              labelText: 'Address Line 1', controller: _addressLine1Controller),
          Gap(35.h),
          CustomTextFormField(
              labelText: 'Address Line 2', controller: _addressLine2Controller),
          Gap(35.h),
          CustomTextFormField(labelText: 'City', controller: _cityController),
          Gap(35.h),
          Row(
            children: [
              Expanded(
                  child: CustomTextFormField(
                      labelText: 'Area', controller: _areaController)),
              Gap(52.w),
              Expanded(
                  child: CustomTextFormField(
                      labelText: 'Country', controller: _countryController)),
            ],
          ),
          Gap(40.h),
          CustomTwoButtons(
              leftButtonName: 'Cancel',
              onLeftButtonPressed: () {
                Get.back();
              },
              rightButtonName: 'Save',
              onRightButtonPressed: () {
                Get.back();
              }),
          Gap(32.h),
        ],
      ),
    );
  }
}
