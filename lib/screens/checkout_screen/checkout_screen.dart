import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/models/cart_item_model.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/create_order_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/order_package_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_address_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/controllers/step_delivery_type_controller.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/models/create_order_model.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/widgets/step_address_widget.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/widgets/step_delivery_type_widget.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/widgets/step_payment_method_widget.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screen/widgets/step_summary_widget.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _createOrderController = Get.find<CreateOrderController>();

  int _currentStep = 0;
  List<Step> _stepList() {
    return [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 0 ? 'Delivery' : '',
            style: Get.textTheme.titleSmall),
        content: const StepDeliveryTypeWidget(),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 1 ? 'Address' : '',
            style: Get.textTheme.titleSmall),
        content: const StepAddressWidget(),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 2 ? 'Summary' : '',
            style: Get.textTheme.titleSmall),
        content: StepSummaryWidget(),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 3 ? 'Payments' : '',
            style: Get.textTheme.titleSmall),
        content: const StepPaymentMethodWidget(),
      ),
    ];
  }

  List<String> cartIdList = [];
  List<String> packageCodeList = [];
  _getCartIdAndPackageCode() {
    for (int i = 0; i < _createOrderController.cartItemList.length; i++) {
      CartItemModel cartItem = _createOrderController.cartItemList[i];
      cartIdList.add(cartItem.id!);
      packageCodeList.add(Get.find<OrderPackageController>().packageCode!);
    }
  }

  String? _addressId;

  @override
  void initState() {
    super.initState();
    Get.find<StepAddressController>().getShippingAddress();
    _addressId = Get.find<StepAddressController>().readAddress!.id;
    Get.find<OrderPackageController>().getPackageData();
    _getCartIdAndPackageCode();
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
                connectorColor: const WidgetStatePropertyAll(orangeClr),
                connectorThickness: 3.h,
                steps: _stepList(),
                type: StepperType.horizontal,
                elevation: 0,
                currentStep: _currentStep,
                controlsBuilder: (context, details) {
                  return const SizedBox();
                },
              ),
            ),
            GetBuilder<CreateOrderController>(builder: (controller) {
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
                                child: Text('Back',
                                    style: Get.textTheme.titleMedium),
                              ),
                            ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              final isLastStep =
                                  _currentStep == _stepList().length - 1;
                              if (isLastStep) {
                                final createOrder = CreateOrderModel(
                                    carts: cartIdList,
                                    address: _addressId,
                                    amount: _createOrderController.totalAmount,
                                    paymentMethod: 'CASH_ON_DELIVERY',
                                    note: 'Deliver This Product',
                                    delivery:
                                        Get.find<StepDeliveryTypeController>()
                                            .selectedOption!
                                            .value,
                                    packageCode: packageCodeList);
                                print(createOrder.carts);
                                print(createOrder.address);
                                print(createOrder.amount);
                                print(createOrder.paymentMethod);
                                print(createOrder.note);
                                print(createOrder.delivery);
                                print(createOrder.packageCode);
                                final result = await controller.createOrder(
                                    orderModel: createOrder);
                                if (result == true) {
                                  Get.offNamed(AppRoutes.paymentSuccessScreen);
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
}
