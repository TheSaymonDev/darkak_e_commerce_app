import 'package:darkak_e_commerce_app/controllers/address_view_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
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
            GetBuilder<AddressViewController>(
                builder: (controller) => controller.addressList.isEmpty
                    ? const Center(
                        child: Text('No Address Added'),
                      )
                    : controller.isLoading
                        ? customCircularProgressIndicator
                        : Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final address = controller.addressList[index];
                                  return SizedBox(
                                    width: double.infinity.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${address.fullName}',
                                                style:
                                                    Get.textTheme.titleMedium),
                                            Text('${address.mobile}',
                                                style: Get
                                                    .textTheme.titleMedium!
                                                    .copyWith(color: greyClr))
                                          ],
                                        ),
                                        Gap(8.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    '${address.address}, ${address.area}, ${address.zip}\n${address.thana}, ${address.city}, ${address.state}',
                                                    style: Get
                                                        .textTheme.bodyMedium)),
                                            CustomEditDeleteButtons(
                                              isEditable: true,
                                              onTap: () {
                                                Get.to(() =>
                                                    AddressEditableScreen(
                                                      title: 'Update Address',
                                                      readAddressModel: address,
                                                    ));
                                              },
                                            ),
                                          ],
                                        ),
                                        Gap(8.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Visibility(
                                              visible:
                                                  address.shippingAddress ==
                                                      true,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w,
                                                    vertical: 8.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    color: Colors.orange[100]),
                                                child: Text('Default Address',
                                                    style: Get
                                                        .textTheme.titleSmall),
                                              ),
                                            ),
                                            CustomEditDeleteButtons(
                                              isEditable: false,
                                              onTap: () {
                                                showDialogBox(
                                                  title: 'Remove',
                                                  middleText:
                                                      'Are you sure want to remove?',
                                                  onPressedCancel: () {
                                                    Get.back();
                                                  },
                                                  onPressedConfirm: () {
                                                    controller.removeAddress(
                                                        address.id!);
                                                    Get.back();
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
                                itemCount: controller.addressList.length),
                          )),
            Gap(40.h),
            CustomElevatedButton(
                onPressed: () {
                  Get.to(() => const AddressEditableScreen(
                        title: 'Add New Address',
                      ));
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
