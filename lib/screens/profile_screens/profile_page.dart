import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/screens/authentication_screens/sign_in_page.dart';
import 'package:darkak_e_commerce_app/screens/order_history_screen/my_order_screen/my_order_page.dart';
import 'package:darkak_e_commerce_app/screens/profile_screens/profile_update_page.dart';
import 'package:darkak_e_commerce_app/screens/address_screen/shipping_address_page.dart';
import 'package:darkak_e_commerce_app/screens/order_tracking_screen/order_tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  bool _isNotification = false;

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
                      backgroundColor: orangeColor,
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
                        style: myTextStyle(25.sp, FontWeight.bold, textColor),
                      ),
                      Gap(4.h),
                      Text(
                        'yourmail@gmail.com',
                        style: myTextStyle(20.sp, FontWeight.normal, textColor),
                      ),
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
                        Get.to(ProfileUpdatePage());
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/profile-edit.svg',
                          title: 'Edit Profile',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeColor,
                            size: 27.sp,
                          )),
                    ),
                    Gap(20.h),
                    InkWell(
                      onTap: () {
                        Get.to(const ShippingAddressPage());
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/shipping-address.svg',
                          title: 'Shipping Address',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeColor,
                            size: 27.sp,
                          )),
                    ),
                    Gap(20.h),
                    InkWell(
                      onTap: () {
                        Get.to(const MyOrderPage());
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/my-order.svg',
                          title: 'My Order',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeColor,
                            size: 27.sp,
                          )),
                    ),
                    Gap(20.h),
                    InkWell(
                      onTap: () {
                        Get.to(const OrderTrackingPage(orderID: '00001',));
                      },
                      child: _accountItem(
                          iconUrl: 'assets/images/track-order.svg',
                          title: 'Track Order',
                          widget: Icon(
                            Icons.keyboard_arrow_right,
                            color: orangeColor,
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
              style: myTextStyle(25.sp, FontWeight.bold, textColor),
            ),
          ),
          Gap(20.h),
          Center(
            child: Text(
              'Are you sure want to logout?',
              style: myTextStyle(25.sp, FontWeight.normal, textColor),
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
                Get.offAll(() => const SignInPage());
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
            style: myTextStyle(20.sp, FontWeight.normal, textColor),
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }
}
