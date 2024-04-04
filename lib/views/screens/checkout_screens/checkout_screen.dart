import 'package:darkak_e_commerce_app/controllers/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
import 'package:darkak_e_commerce_app/controllers/order_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/models/final_cart_item.dart';
import 'package:darkak_e_commerce_app/models/final_order_model.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/address_section_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/delivery_type_section_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/payment_method_section_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/checkout_screens/summary_section_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  final List<CartItem> cartItemList;
  final int totalAmount;
  const CheckOutScreen(
      {super.key, required this.cartItemList, required this.totalAmount});

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
        title: Text(_currentStep == 0 ? 'Delivery' : '',
            style: Get.textTheme.titleSmall),
        content: const DeliveryTypeSectionScreen(),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 1 ? 'Address' : '',
            style: Get.textTheme.titleSmall),
        content: const AddressSectionScreen(),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 2 ? 'Summary' : '',
            style: Get.textTheme.titleSmall),
        content: SummarySectionScreen(
          cartItemList: widget.cartItemList,
          totalAmount: widget.totalAmount,
        ),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 3 ? 'Payments' : '',
            style: Get.textTheme.titleSmall),
        content: const PaymentMethodSectionScreen(),
      ),
    ];
  }

  final CheckOutScreenController _checkOutScreenController =
      Get.find<CheckOutScreenController>();

  List<String> cartIdList = [];

  getCartId() {
    for (int i = 0; i < widget.cartItemList.length; i++) {
      CartItem cartItem = widget.cartItemList[i];
      cartIdList.add(cartItem.id!);
    }
  }

  @override
  void initState() {
    super.initState();
    getCartId();
  }

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
            GetBuilder<OrderController>(builder: (controller) {
              return controller.isLoading == true
                  ? customCircularProgressIndicator
                  : Padding(
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
                                    border: Border.all(
                                        color: orangeClr, width: 2.w),
                                    color: whiteClr),
                                child: Text(
                                  'Back',
                                  style: Get.textTheme.titleMedium,
                                ),
                              ),
                            ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              final isLastStep =
                                  _currentStep == _stepList().length - 1;
                              if (isLastStep) {
                                final order = OrderModel(
                                    carts: cartIdList,
                                    address:
                                        _checkOutScreenController.addressId,
                                    amount: widget.totalAmount,
                                    paymentMethod: 'CASH_ON_DELIVERY',
                                    delivery: _checkOutScreenController
                                        .selectedOption!.value,
                                    note: 'Deliver This Product');
                                print(order.carts);
                                print(order.address);
                                print(order.amount);
                                print(order.paymentMethod);
                                print(order.delivery);
                                print(order.note);
                                final result = await controller.createOrder(
                                 orderModel: order
                                );
                                if (result == true) {
                                  Get.find<CartItemController>().getCartItem();
                                  Get.to(() => const PaymentSuccessScreen());
                                }
                              } else {
                                setState(() {
                                  _currentStep++;
                                });
                              }
                            },
                            child: Container(
                              height: 55.h,
                              width: 146.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: orangeClr,
                              ),
                              child: Text(isLastStep ? 'Confirm' : 'Next',
                                  style: Get.textTheme.titleMedium!
                                      .copyWith(color: whiteClr)),
                            ),
                          ),
                        ],
                      ),
                    );
            }),
            Gap(32.h),
          ],
        ),
      ),
    );
  }

  // void _assignAddress() {
  //   final addressLine1 = _checkOutScreenController.addressLine1Controller.text;
  //   final addressLine2 = _checkOutScreenController.addressLine2Controller.text;
  //   final division = _checkOutScreenController.selectedDivision ?? '';
  //   final district = _checkOutScreenController.selectedDistrict ?? '';
  //   final subDistrict = _checkOutScreenController.selectedSubDistrict ?? '';
  //   final zipCode = _checkOutScreenController.zipCodeController.text;
  //   _checkOutScreenController.finalAddress =
  //       '$addressLine1, $addressLine2, $division, $district, $subDistrict-$zipCode';
  // }
}
