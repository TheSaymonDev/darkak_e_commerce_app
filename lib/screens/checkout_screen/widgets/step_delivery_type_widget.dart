import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_delivery_type_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/models/delivery_option_model.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StepDeliveryTypeWidget extends StatelessWidget {
  const StepDeliveryTypeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          DeliveryOptionModel.deliveryOptionList.length,
              (index) => Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child:
            GetBuilder<StepDeliveryTypeController>(builder: (controller) {
              return RadioListTile<DeliveryOptionModel>(
                activeColor: orangeClr,
                tileColor: whiteClr,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DeliveryOptionModel.deliveryOptionList[index].title,
                      style: Get.textTheme.titleLarge,
                    ),
                    Gap(8.h),
                  ],
                ),
                subtitle: Text(
                  DeliveryOptionModel.deliveryOptionList[index].subTitle,
                  style: Get.textTheme.bodyMedium,
                ),
                groupValue: controller.selectedOption,
                value: DeliveryOptionModel.deliveryOptionList[index],
                onChanged: (value) => controller.deliveryTypeOnChanged(value),
              );
            }),
          )),
    );
  }
}