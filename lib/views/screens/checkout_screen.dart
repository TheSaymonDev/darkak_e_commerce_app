import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/address_section_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/delivery_type_section_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/payment_method_section_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/summary_section.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _currentStep = 0;
  List<Step> _stepList() {
    return [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 0 ? 'Delivery' : '',
          style: myStyle(15.sp, FontWeight.bold, blackClr),
        ),
        content: const DeliveryTypeSectionScreen(),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 1 ? 'Address' : '',
          style: myStyle(15.sp, FontWeight.bold, blackClr),
        ),
        content: const AddressSectionScreen(),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 2 ? 'Summary' : '',
          style: myStyle(15.sp, FontWeight.bold, blackClr),
        ),
        content: const SummarySectionScreen(),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 3 ? 'Payments' : '',
          style: myStyle(15.sp, FontWeight.bold, blackClr),
        ),
        content: const PaymentMethodSectionScreen(),
      ),
    ];
  }

  final CheckOutScreenController _checkOutScreenController =
      Get.find<CheckOutScreenController>();

  @override
  Widget build(BuildContext context) {
    final isLastStep = _currentStep == _stepList().length - 1;
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Checkout',
      ),
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                connectorColor: const MaterialStatePropertyAll(orangeClr),
                connectorThickness: 3.h,
                steps: _stepList(),
                onStepTapped: (step) {
                  setState(() {
                    _currentStep = step;
                  });
                },
                type: StepperType.horizontal,
                elevation: 0,
                currentStep: _currentStep,
                controlsBuilder: (context, details) {
                  return const SizedBox();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  if (_currentStep > 0)
                    GestureDetector(
                      onTap: () {
                        if (_currentStep == 0) {
                          return;
                        } else {
                          setState(() {
                            _currentStep = _currentStep - 1;
                          });
                        }
                      },
                      child: Container(
                        height: 55.h,
                        width: 146.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: orangeClr, width: 2.w),
                            color: whiteClr),
                        child: Text(
                          'Back',
                          style: myStyle(20.sp, FontWeight.bold, blackClr),
                        ),
                      ),
                    ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      final isLastStep = _currentStep == _stepList().length - 1;
                      if (isLastStep) {
                        Get.to(() => const PaymentSuccessScreen());
                        // setState(() {
                        //   _isCompleted = true;
                        // });
                        // print('Completed');
                        // send data to server
                      } else {
                            if (_checkOutScreenController.formKey.currentState?.validate() ?? false) {
                             if(_currentStep ==1){

                             }
                             setState(() {
                               _currentStep = _currentStep + 1;
                             });
                            }
                      }
                    },
                    child: Container(
                      height: 55.h,
                      width: 146.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: orangeClr),
                      child: Text(
                        isLastStep ? 'Confirm' : 'Next',
                        style: myStyle(20.sp, FontWeight.bold, whiteClr),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(32.h),
          ],
        ),
      ),
    );
  }

  // Widget buildCompleted() {
  //   return Center(
  //     child: Column(
  //       children: [
  //         const Icon(
  //           Icons.verified,
  //           size: 50,
  //           color: Colors.green,
  //         ),
  //         TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 _isCompleted = false;
  //               });
  //             },
  //             child: const Text('Reset')),
  //       ],
  //     ),
  //   );
  // }
}
