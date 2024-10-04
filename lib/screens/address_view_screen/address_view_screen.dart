import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/controllers/address_view_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_edit_delete_buttons.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddressViewScreen extends StatelessWidget {
  const AddressViewScreen({super.key});

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
                builder: (controller) => controller.isLoading
                    ? Center(child: customCircularProgressIndicator)
                    : controller.addressListData.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text('No Address Added'),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final address = controller.addressListData[index];
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
                                                Get.toNamed(AppRoutes.addressUpdateScreen, arguments: {'shippingAddressData': address});
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
                                          color: orangeClr.withValues(alpha: 0.3),
                                          thickness: 1.h,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => Gap(48.h),
                                itemCount: controller.addressListData.length),
                          )),
            Gap(40.h),
            CustomElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.addressCreateScreen);
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
