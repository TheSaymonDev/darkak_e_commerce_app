import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/controllers/profile_screen_controller.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_outlined_button.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_shimmer.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/widgets/profile_screen_widgets/profile_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    String token = SharedPreferencesService().getToken();
    return token.isNotEmpty
        ? _buildLoggedProfileScreen
        : _buildWithOutLoggedProfileScreen;
  }

  Widget get _buildLoggedProfileScreen {
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
                      height: 110.h,
                      width: 110.w,
                      child: GetBuilder<ProfileController>(
                        builder: (controller) {
                          return controller.isLoading == true
                              ? CustomShimmer(
                                  height: 110.h,
                                  width: 110.w,
                                  isCircle: true,
                                )
                              : CircleAvatar(
                                  backgroundColor: orangeClr,
                                  backgroundImage: controller
                                              .user!.profileImage ==
                                          null
                                      ? const AssetImage(
                                          'assets/images/profile-photo.png',
                                        )
                                      : NetworkImage(
                                              '${AppUrls.imgUrl}${controller.user!.profileImage!.path}')
                                          as ImageProvider,
                                );
                        },
                      )),
                  Gap(16.w),
                  Expanded(
                    child: GetBuilder<ProfileController>(builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              controller.user?.name ??
                                  'Fetching Profile...', // Use ?? for default value
                              style: Get.textTheme.titleLarge),
                          Gap(4.h),
                          Text(
                            controller.user?.email ?? '',
                            style: Get.textTheme.bodyMedium,
                          ),
                        ],
                      );
                    }),
                  ),
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
                        Get.toNamed(AppRoutes.profileUpdateScreen,
                            arguments: {'userData': _profileController.user});
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/profile-edit.svg',
                        title: 'Edit Profile',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.addressViewScreen);
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/shipping-address.svg',
                        title: 'Shipping Address',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.myOrderScreen);
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/my-order.svg',
                        title: 'My Order',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.privacyPolicyScreen);
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/support.svg',
                        title: 'Privacy Policy',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                       Get.toNamed(AppRoutes.helpAndSupportScreen);
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/support.svg',
                        title: 'Help & Support',
                      ),
                    ),
                    Gap(16.h),
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
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                       Get.toNamed(AppRoutes.aboutScreen);
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/support.svg',
                        title: 'About Us',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet();
                      },
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

  Widget get _buildWithOutLoggedProfileScreen {
    return SafeArea(
      child: SizedBox(
        width: double.infinity.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(20.h),
            Text('Welcome To', style: Get.textTheme.titleLarge),
            SvgPicture.asset(AppUrls.appLogoSvg, height: 86.h, width: 110.w),
            Gap(8.h),
            Text('Mart', style: Get.textTheme.titleSmall),
            Gap(32.h),
            Text(
              'Continue Shopping Please Sign In Or Sign Up',
              style: Get.textTheme.bodyMedium,
            ),
            Gap(16.h),
            CustomOutlinedButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.signInScreen);
                },
                buttonName: 'Sign In',
                buttonWidth: 150.w)
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
            child: Text('Logout', style: Get.textTheme.titleLarge),
          ),
          Gap(20.h),
          Center(
            child: Text('Are you sure want to logout?',
                style: Get.textTheme.bodyLarge),
          ),
          Gap(50.h),
          CustomTwoButtons(
              leftButtonName: 'Cancel',
              onLeftButtonPressed: () {
                Get.back();
              },
              rightButtonName: 'Logout',
              onRightButtonPressed: () {
                SharedPreferencesService().clearUserData();
                Get.offAllNamed(AppRoutes.signInScreen);
              }),
          Gap(32.h)
        ],
      ),
    );
  }
}
