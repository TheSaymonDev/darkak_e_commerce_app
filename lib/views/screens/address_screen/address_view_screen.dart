import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/models/address_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_edit_delete_buttons.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/address_screen/address_editable_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressViewScreen extends StatefulWidget {
  const AddressViewScreen({super.key});

  @override
  State<AddressViewScreen> createState() => _AddressViewScreenState();
}

class _AddressViewScreenState extends State<AddressViewScreen> {

  int selectedAddressIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
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
                  itemBuilder: (context, index) {
                    final address = AddressModel.addressList[index];
                    return SizedBox(
                      width: double.infinity.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${address.division}, ${address.district}, ${address.subDistrict}\n${address.addressLine1}',
                                style: myStyle(
                                    20.sp, FontWeight.bold, blackClr),
                              ),
                              CustomEditDeleteButtons(
                                isEditable: true,
                                onTap: () {
                                  Get.to(()=>const AddressEditableScreen(title: 'Update Address',));
                                },
                              ),
                            ],
                          ),
                          Gap(8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: index,
                                    groupValue: selectedAddressIndex,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedAddressIndex = newValue as int;
                                      });
                                    },
                                    activeColor: orangeClr,
                                  ),
                                  Text(
                                    'Use as the shipping address',
                                    style: myStyle(
                                        20.sp, FontWeight.normal, blackClr),
                                  ),
                                ],
                              ),
                              CustomEditDeleteButtons(
                                isEditable: false,
                                onTap: () {
                                  showDialogBox(
                                    title: 'Remove',
                                    middleText: 'Are you sure want to remove?',
                                    onPressedCancel: () {
                                      Get.back();
                                    },
                                    onPressedConfirm: () {
                                      setState(() {
                                        AddressModel.addressList
                                            .removeAt(index);
                                        Get.back();
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: orangeClr.withOpacity(0.3),
                            thickness: 1.h,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(48.h),
                  itemCount: AddressModel.addressList.length),
            ),
            Gap(40.h),
            CustomElevatedButton(
                onPressed: () {
                  Get.to(() => const AddressEditableScreen(title: 'Add New Address',));
                },
                buttonName: 'Add New',
                width: double.infinity.w),
            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
