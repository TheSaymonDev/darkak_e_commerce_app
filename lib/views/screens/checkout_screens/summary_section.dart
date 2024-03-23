import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SummarySectionScreen extends StatefulWidget {
  const SummarySectionScreen({super.key});

  @override
  State<SummarySectionScreen> createState() => _SummarySectionScreenState();
}

class _SummarySectionScreenState extends State<SummarySectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SizedBox(
                width: double.infinity,
                height: 100.h,
                child: Row(
                  children: [
                    Container(
                      width: 100.w,
                      height: double.infinity.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          image: const DecorationImage(
                              image: AssetImage(Urls.sareeImage))),
                    ),
                    Gap(40.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saree',
                          style: Get.textTheme.bodyLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              '${Urls.takaSign}500',
                              style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)
                            ),
                            Gap(48.w),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: yellowClr,
                                  size: 20.sp,
                                ),
                                Text(
                                  '4.5',
                                  style: Get.textTheme.bodyMedium
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Size: M',
                              style: Get.textTheme.bodyMedium,
                            ),
                            Gap(48.w),
                            Text(
                              'Quantity: 3',
                              style: Get.textTheme.bodyMedium
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => Gap(16.h),
              itemCount: 3),
        ),
        Divider(
          color: orangeClr.withOpacity(0.3),
          thickness: 1.h,
        ),
        Text(
          'Shipping Address',
          style: Get.textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dhaka, Dhaka North,\nBanani Road No. 12 - 19',
              style: Get.textTheme.bodyMedium,
            ),
            Checkbox(
              value: true,
              onChanged: (newValue) {},
              activeColor: orangeClr,
              shape: const CircleBorder(),
            )
          ],
        ),
        Divider(
          color: orangeClr.withOpacity(0.3),
          thickness: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Delivery charge',
              style: Get.textTheme.bodyMedium
            ),
            Text(
              '----------------------',
              style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)
            ),
            Text(
              '${Urls.takaSign}50',
              style: Get.textTheme.bodyMedium
            )
          ],
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Amount',
              style: Get.textTheme.bodyMedium
            ),
            Text(
              '----------------------',
              style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)
            ),
            Text(
              '${Urls.takaSign}2500',
              style: Get.textTheme.bodyMedium
            )
          ],
        ),
        Divider(
          color: orangeClr.withOpacity(0.3),
          thickness: 1.h,
        ),
      ],
    );
  }
}
