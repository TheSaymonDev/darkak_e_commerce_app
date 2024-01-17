import 'package:darkak_e_commerce_app/models/address_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_edit_delete_buttons.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/screens/address_screen/address_add_update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressViewPage extends StatefulWidget {
  const AddressViewPage({super.key});

  @override
  State<AddressViewPage> createState() => _AddressViewPageState();
}

class _AddressViewPageState extends State<AddressViewPage> {

  int selectedAddressIndex = -1;

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
                                style: myTextStyle(
                                    20.sp, FontWeight.bold, textColor),
                              ),
                              CustomEditDeleteButtons(
                                isEditable: true,
                                onTap: () {
                                  Get.to(()=>const AddressAddUpdatePage(title: 'Update Address',));
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
                                    activeColor: orangeColor,
                                  ),
                                  Text(
                                    'Use as the shipping address',
                                    style: myTextStyle(
                                        20.sp, FontWeight.normal, textColor),
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
                            color: orangeColor.withOpacity(0.3),
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
            CustomOrangeButton(
                onPressed: () {
                  Get.to(() => const AddressAddUpdatePage(title: 'Add New Address',));
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
