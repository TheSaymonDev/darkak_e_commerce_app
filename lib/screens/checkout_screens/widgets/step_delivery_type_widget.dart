import 'package:darkak_e_commerce_app/screens/checkout_screens/controller/step_delivery_type_controller.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screens/model/delivery_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class StepDeliveryTypeWidget extends StatefulWidget {
  const StepDeliveryTypeWidget({super.key});
  @override
  State<StepDeliveryTypeWidget> createState() =>
      _StepDeliveryTypeWidgetState();
}
class _StepDeliveryTypeWidgetState extends State<StepDeliveryTypeWidget> {

  
  @override
  void initState() {
    super.initState();
    Get.find<StepDeliveryTypeController>().deliveryTypeOnChanged(DeliveryOption.deliveryOptionList[0]);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          DeliveryOption.deliveryOptionList.length,
          (index) => Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child:
                    GetBuilder<StepDeliveryTypeController>(builder: (controller) {
                  return RadioListTile<DeliveryOption>(
                    activeColor: orangeClr,
                    tileColor: whiteClr,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DeliveryOption.deliveryOptionList[index].title,
                          style: Get.textTheme.titleLarge,
                        ),
                        Gap(8.h),
                      ],
                    ),
                    subtitle: Text(
                      DeliveryOption.deliveryOptionList[index].subTitle,
                      style: Get.textTheme.bodyMedium,
                    ),
                    groupValue: controller.selectedOption,
                    value: DeliveryOption.deliveryOptionList[index],
                    onChanged: (value) => controller.deliveryTypeOnChanged(value),
                  );
                }),
              )),
    );
  }
}
