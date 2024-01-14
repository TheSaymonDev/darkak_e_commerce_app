import 'package:darkak_e_commerce_app/models/delivery_option_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/screens/summary_screen/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _areaController = TextEditingController();
  final _countryController = TextEditingController();

  final _nameOfCardController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  bool _isCheckedBilling = false;
  bool _isCheckedCard = false;
  int _currentStep = 0;
  DeliveryOptions? _selectedOption;
  List<Step> _stepList() {
    return [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text(
          'Delivery',
          style: myTextStyle(20.sp, FontWeight.normal, textColor),
        ),
        content: _step1Content(),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(
          'Address',
          style: myTextStyle(20.sp, FontWeight.normal, textColor),
        ),
        content: _step2Content(),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text(
          'Payments',
          style: myTextStyle(20.sp, FontWeight.normal, textColor),
        ),
        content: _step3Content(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLastStep = _currentStep == _stepList().length - 1;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Checkout',
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              connectorColor: MaterialStatePropertyAll(orangeColor),
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
                          border: Border.all(color: orangeColor, width: 2.w),
                          color: backgroundColor),
                      child: Text(
                        'Back',
                        style: myTextStyle(20.sp, FontWeight.bold, textColor),
                      ),
                    ),
                  ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    final isLastStep = _currentStep == _stepList().length - 1;
                    if (isLastStep) {
                      Get.to(() => const SummaryPage());
                      // setState(() {
                      //   _isCompleted = true;
                      // });
                      // print('Completed');
                      // send data to server
                    } else {
                      if (_selectedOption != null) {
                        setState(() {
                          _currentStep = _currentStep + 1;
                        });
                      } else {
                        customSnackMessage(title: 'Please select an option');
                      }
                    }
                  },
                  child: Container(
                    height: 55.h,
                    width: 146.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: orangeColor),
                    child: Text(
                      isLastStep ? 'Confirm' : 'Next',
                      style:
                          myTextStyle(20.sp, FontWeight.bold, backgroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(40.h),
        ],
      ),
    );
  }

  Column _step1Content() {
    return Column(
      children: List.generate(
          DeliveryOptions.deliveryOptionList.length,
          (index) => Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: RadioListTile<DeliveryOptions>(
                  activeColor: orangeColor,
                  tileColor: backgroundColor,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DeliveryOptions.deliveryOptionList[index].title,
                        style: myTextStyle(25.sp, FontWeight.bold, textColor),
                      ),
                      Gap(8.h),
                    ],
                  ),
                  subtitle: Text(
                    DeliveryOptions.deliveryOptionList[index].subTitle,
                    style: myTextStyle(20.sp, FontWeight.normal, textColor),
                  ),
                  groupValue: _selectedOption,
                  value: DeliveryOptions.deliveryOptionList[index],
                  onChanged: (value) => setState(() => _selectedOption = value),
                ),
              )),
    );
  }

  Column _step2Content() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: _isCheckedBilling,
              onChanged: (value) {
                setState(() {
                  _isCheckedBilling = !_isCheckedBilling;
                });
              },
              activeColor: orangeColor,
            ),
            Expanded(
                child: Text(
              'Billing address is the same as delivery address',
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
            )),
          ],
        ),
        Gap(35.h),
        CustomTextFormField(
            labelText: 'Address line 1', controller: _addressLine1Controller),
        Gap(35.h),
        CustomTextFormField(
            labelText: 'Address line 2', controller: _addressLine2Controller),
        Gap(35.h),
        CustomTextFormField(labelText: 'City', controller: _cityController),
        Gap(35.h),
        Row(
          children: [
            Expanded(
                child: CustomTextFormField(
                    labelText: 'Area', controller: _areaController)),
            Gap(40.w),
            Expanded(
                child: CustomTextFormField(
                    labelText: 'Country', controller: _countryController)),
          ],
        ),
      ],
    );
  }

  Column _step3Content() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50.h,
                child: SvgPicture.asset(
                  'assets/images/mobile-banking.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(4.w),
            Expanded(
              child: SizedBox(
                height: 50.h,
                child: SvgPicture.asset(
                  'assets/images/credit-card.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(4.w),
            Expanded(
              child: SizedBox(
                height: 50.h,
                child: SvgPicture.asset(
                  'assets/images/saved-card.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(4.w),
            Expanded(
              child: SizedBox(
                height: 50.h,
                child: SvgPicture.asset(
                  'assets/images/wallet.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Gap(45.h),
        CustomTextFormField(
            labelText: 'Name on Card', controller: _nameOfCardController),
        Gap(35.h),
        CustomTextFormField(
            labelText: 'Card Number', controller: _cardNumberController),
        Gap(35.h),
        Row(
          children: [
            Expanded(
                child: CustomTextFormField(
                    labelText: 'Expiry Date',
                    controller: _expiryDateController)),
            Gap(40.w),
            Expanded(
                child: CustomTextFormField(
                    labelText: 'CVV', controller: _cvvController)),
          ],
        ),
        Gap(40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: _isCheckedCard,
              onChanged: (value) {
                setState(() {
                  _isCheckedCard = !_isCheckedCard;
                });
              },
              activeColor: orangeColor,
            ),
            Expanded(
                child: Text(
              'Billing address is the same as delivery address',
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
            )),
          ],
        ),
      ],
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
