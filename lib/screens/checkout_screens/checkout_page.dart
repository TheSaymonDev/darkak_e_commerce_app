import 'package:darkak_e_commerce_app/models/delivery_option_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/utility.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_dropdown_button.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/screens/payment_screen/payment_success_page.dart';
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

class _CheckOutPageState extends State<CheckOutPage>
    with TickerProviderStateMixin {
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();

  int _currentStep = 0;
  DeliveryOptions? _selectedOption;

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Step> _stepList() {
    return [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 0 ? 'Delivery' : '',
          style: myTextStyle(15.sp, FontWeight.bold, textColor),
        ),
        content: _step1Content(),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 1 ? 'Address' : '',
          style: myTextStyle(15.sp, FontWeight.bold, textColor),
        ),
        content: _step2Content(),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 2 ? 'Summary' : '',
          style: myTextStyle(15.sp, FontWeight.bold, textColor),
        ),
        content: _step3Content(),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        title: Text(
          _currentStep == 3 ? 'Payments' : '',
          style: myTextStyle(15.sp, FontWeight.bold, textColor),
        ),
        content: _step4Content(),
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
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                connectorColor: MaterialStatePropertyAll(orangeColor),
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
                        Get.to(() => const PaymentSuccessPage());
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
                        style: myTextStyle(
                            20.sp, FontWeight.bold, backgroundColor),
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

  List<String> addressList = ['Address 1', 'Address 2', 'Address 3'];
  String? selectedAddress;

  final _zipCodeController = TextEditingController();

  final List<String> _divisionList = ['Dhaka', 'Chittagong'];
  String? _selectedDivision;

  final List<String> _districtList = ['Cumilla', 'Feni'];
  String? _selectedDistrict;

  final List<String> _subDistrictList = ['Chandina', 'Devidwar'];
  String? _selectedSubDistrict;

  Column _step2Content() {
    return Column(
      children: [
        CustomDropdownButton(
            items: addressList,
            onChanged: (newValue) {
              setState(() {
                selectedAddress = newValue;
              });
            },
            labelText: 'Default Address'),
        Gap(40.h),
        CustomTextFormField(
            labelText: 'Address Line 1', controller: _addressLine1Controller),
        Gap(35.h),
        CustomTextFormField(
            labelText: 'Address Line 2', controller: _addressLine2Controller),
        Gap(35.h),
        Row(
          children: [
            Expanded(
              child: CustomDropdownButton(
                  items: _divisionList,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDivision = newValue;
                    });
                  },
                  labelText: 'Division'),
            ),
            Gap(32.w),
            Expanded(
              child: CustomDropdownButton(
                  items: _districtList,
                  onChanged: (newValue) {
                    _selectedDistrict = newValue;
                  },
                  labelText: 'District'),
            ),
          ],
        ),
        Gap(35.h),
        Row(
          children: [
            Expanded(
              child: CustomDropdownButton(
                  items: _subDistrictList,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSubDistrict = newValue;
                    });
                  },
                  labelText: 'Subdistrict'),
            ),
            Gap(32.w),
            Expanded(
                child: CustomTextFormField(
              labelText: 'Zip Code',
              controller: _zipCodeController,
              keyBoardType: TextInputType.number,
            ))
          ],
        ),
      ],
    );
  }

  Column _step3Content() {
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
                                  image: AssetImage(sareeImage))),
                        ),
                        Gap(40.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saree',
                              style: myTextStyle(
                                  25.sp, FontWeight.normal, textColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${takaSign}500',
                                  style: myTextStyle(
                                      20.sp, FontWeight.normal, orangeColor),
                                ),
                                Gap(48.w),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 20.sp,
                                    ),
                                    Text(
                                      '4.5',
                                      style: myTextStyle(
                                          20.sp, FontWeight.normal, textColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Size: M',
                                  style: myTextStyle(
                                      20.sp, FontWeight.normal, textColor),
                                ),
                                Gap(48.w),
                                Text(
                                  'Quantity: 3',
                                  style: myTextStyle(
                                      20.sp, FontWeight.normal, textColor),
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
          color: orangeColor.withOpacity(0.3),
          thickness: 1.h,
        ),
        Text(
          'Shipping Address',
          style: myTextStyle(25.sp, FontWeight.bold, textColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dhaka, Dhaka North,\nBanani Road No. 12 - 19',
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
            ),
            Checkbox(
              value: true,
              onChanged: (newValue) {},
              activeColor: orangeColor,
              shape: const CircleBorder(),
            )
          ],
        ),
        Divider(
          color: orangeColor.withOpacity(0.3),
          thickness: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Delivery charge',
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
            ),
            Text(
              '----------------------',
              style: myTextStyle(20.sp, FontWeight.normal, orangeColor),
            ),
            Text(
              '${takaSign}50',
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
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
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
            ),
            Text(
              '----------------------',
              style: myTextStyle(20.sp, FontWeight.normal, orangeColor),
            ),
            Text(
              '${takaSign}2500',
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
            )
          ],
        ),
        Divider(
          color: orangeColor.withOpacity(0.3),
          thickness: 1.h,
        ),
      ],
    );
  }

  List<String> mobileBankingImgPath = [
    'assets/images/bkash.svg',
    'assets/images/rocket.svg',
    'assets/images/nagad.svg'
  ];
  int _currentMobileBankingMediumIndex = 0;

  List<String> bankingImgPath = [
    'assets/images/visa.png',
    'assets/images/master_card.png',
    'assets/images/american_express.png'
  ];
  int _currentCardMediumIndex = 0;

  SizedBox _step4Content() {
    return SizedBox(
      height: 700.h,
      child: Column(
        children: [
          TabBar(
            padding: EdgeInsets.zero,
            controller: _tabController,
            indicatorColor: orangeColor,
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  'assets/images/mobile-banking.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/images/credit-card.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/images/saved-card.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/images/wallet.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          Gap(16.h),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SizedBox(
                  width: double.infinity.w,
                  height: 400.h,
                  child: Column(
                    children: List.generate(
                      mobileBankingImgPath.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentMobileBankingMediumIndex = index;
                            });
                          },
                          child: CustomCardStyle(
                            width: double.infinity.w,
                            height: 70.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            border: Border.all(
                                width: 2.w,
                                color: _currentMobileBankingMediumIndex == index
                                    ? orangeColor
                                    : Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                SizedBox(
                                  height: 60.h,
                                  width: 80.w,
                                  child: SvgPicture.asset(
                                    mobileBankingImgPath[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Icon(
                                  Icons.done_all,
                                  color:
                                      _currentMobileBankingMediumIndex == index
                                          ? Colors.green
                                          : Colors.transparent,
                                  size: 25.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity.w,
                  height: 400.h,
                  child: Column(
                    children: List.generate(
                      bankingImgPath.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentCardMediumIndex = index;
                            });
                          },
                          child: CustomCardStyle(
                            width: double.infinity.w,
                            height: 70.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            border: Border.all(
                                width: 2.w,
                                color: _currentCardMediumIndex == index
                                    ? orangeColor
                                    : Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                SizedBox(
                                  height: 60.h,
                                  width: 80.w,
                                  child: Image.asset(
                                    bankingImgPath[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Icon(
                                  Icons.done_all,
                                  color: _currentCardMediumIndex == index
                                      ? Colors.green
                                      : Colors.transparent,
                                  size: 25.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400.h,
                  child: Center(
                    child: Text(
                      'Cash on delivery',
                      style: myTextStyle(25.sp, FontWeight.normal, textColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400.h,
                  child: Center(
                    child: Text(
                      'Wallet',
                      style: myTextStyle(25.sp, FontWeight.normal, textColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
