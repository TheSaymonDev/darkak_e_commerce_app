import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/core/utils/shared_preferences.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/address_screen/address_view_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/order_history_screens/my_order_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/views/screens/profile_update_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/support_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/sign_in_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool _isNotification = false;
  bool _isBalanceShow = false;
  bool _isBalance = true;
  bool _isAnimation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            Gap(20.h),
            SizedBox(
              height: 120.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.h,
                    width: 120.w,
                    child: CircleAvatar(
                      backgroundColor: orangeClr,
                      backgroundImage: const AssetImage(
                        'assets/images/profile-photo.png',
                      ),
                    ),
                  ),
                  Gap(50.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Md. Rabiul Biplob',
                        style: myStyle(25.sp, FontWeight.bold, blackClr),
                      ),
                      Gap(4.h),
                      Text(
                        'yourmail@gmail.com',
                        style: myStyle(20.sp, FontWeight.normal, blackClr),
                      ),
                      Gap(4.h),
                      GestureDetector(
                        onTap: changeState,
                        child: Container(
                          height: 30.h,
                          width: 90.w,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: orangeClr,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedOpacity(
                                opacity: _isBalanceShow ? 1 : 0,
                                duration: Duration(microseconds: 500),
                                child: Text('${takaSign}100', style: myStyle(15.sp, FontWeight.bold, whiteClr),),
                              ),
                              AnimatedOpacity(
                                opacity: _isBalance ? 1 : 0,
                                duration: Duration(microseconds: 300),
                                child: Text('Check\nWallet', style: myStyle(12.sp, FontWeight.bold, whiteClr),),
                              ),
                              AnimatedPositioned(
                                child: CircleAvatar(
                                  radius: 9.r,
                                  backgroundColor: whiteClr,
                                ),
                                duration: Duration(microseconds: 1100),
                                left: _isAnimation == false?5.w:65.w,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(const ProfileUpdateScreen());
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/profile-edit.svg',
                          title: 'Edit Profile',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeClr,
                            size: 27.sp,
                          )),
                    ),
                    Gap(20.h),
                    InkWell(
                      onTap: () {
                        Get.to(const AddressViewScreen());
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/shipping-address.svg',
                          title: 'Shipping Address',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeClr,
                            size: 27.sp,
                          )),
                    ),
                    Gap(20.h),
                    InkWell(
                      onTap: () {
                        Get.to(const MyOrderScreen());
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/my-order.svg',
                          title: 'My Order',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeClr,
                            size: 27.sp,
                          )),
                    ),
                    Gap(20.h),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SupportPage());
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/support.svg',
                          title: 'Help & Support',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeClr,
                            size: 27.sp,
                          )),
                    ),
                    Gap(20.h),
                    _accountItem(
                      iconUrl: 'assets/images/notifications.svg',
                      title: 'Notifications',
                      widget: CustomFlutterSwitch(
                          onToggle: (value) {
                            setState(() {
                              _isNotification = value;
                            });
                          },
                          value: _isNotification),
                    ),
                    Gap(20.h),
                    InkWell(
                      onTap: () {
                        _showBottomSheet();
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/logout.svg',
                          title: 'Logout',
                          widget: const SizedBox()),
                    ),
                    Gap(25.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheet() {
    return Get.bottomSheet(
      CustomBottomSheet(
        children: [
          Center(
            child: Text(
              'Logout',
              style: myStyle(25.sp, FontWeight.bold, blackClr),
            ),
          ),
          Gap(20.h),
          Center(
            child: Text(
              'Are you sure want to logout?',
              style: myStyle(25.sp, FontWeight.normal, blackClr),
            ),
          ),
          Gap(50.h),
          CustomTwoButtons(
              leftButtonName: 'Cancel',
              onLeftButtonPressed: () {
                Get.back();
              },
              rightButtonName: 'Logout',
              onRightButtonPressed: () {
                logOut();
                Get.offAll(() => const SignInScreen());
              }),
          Gap(32.h)
        ],
      ),
    );
  }

  SizedBox _accountItem({
    required String iconUrl,
    required String title,
    required Widget widget,
  }) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SvgPicture.asset(
            iconUrl,
            fit: BoxFit.cover,
            height: 40.h,
            width: 40.w,
          ),
          Gap(30.w),
          Text(
            title,
            style: myStyle(20.sp, FontWeight.normal, blackClr),
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }

  changeState() async{
    _isAnimation=true;
    _isBalance=false;
    setState(() {
    });
    await Future.delayed(Duration(milliseconds: 800), ()=>setState(()=>_isBalanceShow=true));
    await Future.delayed(Duration(milliseconds: 700), ()=>setState(()=>_isBalanceShow=false));
    await Future.delayed(Duration(milliseconds: 400), ()=>setState(()=> _isAnimation = false));
    await Future.delayed(Duration(milliseconds: 600), ()=>setState(()=> _isBalance = true));
  }
}

