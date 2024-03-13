import 'package:darkak_e_commerce_app/controllers/profile_controller.dart';
import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/profile_screen_widgets/profile_item_button.dart';
import 'package:darkak_e_commerce_app/views/screens/address_screen/address_view_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/order_history_screens/my_order_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/profile_update_screen.dart';
import 'package:darkak_e_commerce_app/views/screens/support_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _profileController = Get.find<ProfileController>();

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
                      backgroundImage: _profileController
                                  .user?.profileImage?.path ==
                              null
                          ? const AssetImage(
                              'assets/images/profile-photo.png',
                            )
                          : NetworkImage(
                                  '$imgUrl${_profileController.user!.profileImage!.path}')
                              as ImageProvider,
                    ),
                  ),
                  Gap(50.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _profileController.user?.name ??
                            'Fetching Profile...', // Use ?? for default value
                        style: Get.textTheme.titleLarge,
                      ),
                      Gap(4.h),
                      Text(
                        _profileController.user?.email ?? '',
                        style: Get.textTheme.bodyMedium,
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
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProfileUpdateScreen(
                              id: _profileController.user!.id,
                              imgUrl:
                                  _profileController.user!.profileImage!.path,
                              name: _profileController.user!.name,
                              dob: _profileController.user!.dob,
                              dom: _profileController.user!.marriageDate,
                              mobile: _profileController.user!.mobile,
                            ));
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/profile-edit.svg',
                        title: 'Edit Profile',
                      ),
                    ),
                    Gap(20.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(const AddressViewScreen());
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/shipping-address.svg',
                        title: 'Shipping Address',
                      ),
                    ),
                    Gap(20.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const MyOrderScreen());
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/my-order.svg',
                        title: 'My Order',
                      ),
                    ),
                    Gap(20.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SupportPage());
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/support.svg',
                        title: 'Help & Support',
                      ),
                    ),
                    Gap(20.h),
                    ProfileItemButton(
                        iconUrl: 'assets/images/notifications.svg',
                        title: 'Notifications',
                        widget: GetBuilder<ProfileController>(
                            builder: (controller) {
                          return CustomFlutterSwitch(
                              onToggle: (newValue) {
                                controller.toggleNotification(newValue);
                              },
                              value: controller.isNotification);
                        })),
                    Gap(20.h),
                    GestureDetector(
                      onTap: () {},
                      child: const ProfileItemButton(
                          iconUrl: 'assets/images/logout.svg',
                          title: 'Logout',
                          widget: SizedBox()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<dynamic> _showBottomSheet() {
  //   return Get.bottomSheet(
  //     CustomBottomSheet(
  //       children: [
  //         Center(
  //           child: Text(
  //             'Logout',
  //             style: Get.textTheme.titleLarge,
  //           ),
  //         ),
  //         Gap(20.h),
  //         Center(
  //           child: Text(
  //             'Are you sure want to logout?',
  //             style: Get.textTheme.bodyLarge,
  //           ),
  //         ),
  //         Gap(50.h),
  //         CustomTwoButtons(
  //             leftButtonName: 'Cancel',
  //             onLeftButtonPressed: () {
  //               Get.back();
  //             },
  //             rightButtonName: 'Logout',
  //             onRightButtonPressed: () {
  //               SharedPreferencesService().clearUserData();
  //               Get.offAll(() => SignInScreen());
  //             }),
  //         Gap(32.h)
  //       ],
  //     ),
  //   );
  // }
}
