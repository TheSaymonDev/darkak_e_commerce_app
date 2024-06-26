import 'package:darkak_e_commerce_app/screens/about_screen/about_screen.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/bindings/address_view_binding.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/controller/address_view_controller.dart';
import 'package:darkak_e_commerce_app/screens/cart_screen/controller/cart_item_controller.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/controller/my_order_controller.dart';
import 'package:darkak_e_commerce_app/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:darkak_e_commerce_app/screens/shop_screen/controller/product_list_controller.dart';
import 'package:darkak_e_commerce_app/screens/profile_screen/controller/profile_screen_controller.dart';
import 'package:darkak_e_commerce_app/screens/wishlist_screen/controller/wishlist_item_controller.dart';
import 'package:darkak_e_commerce_app/services/shared_preferences_service.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_flutter_switch.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_outlined_button.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_shimmer.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_two_buttons.dart';
import 'package:darkak_e_commerce_app/widgets/profile_screen_widgets/profile_item_button.dart';
import 'package:darkak_e_commerce_app/screens/address_view_screen/address_view_screen.dart';
import 'package:darkak_e_commerce_app/screens/my_order_screen/my_order_screen.dart';
import 'package:darkak_e_commerce_app/screens/profile_update_screen/profile_update_screen.dart';
import 'package:darkak_e_commerce_app/screens/support_screen/help_and_support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    String token = SharedPreferencesService().getToken();
    return token.isNotEmpty ? _buildLoggedProfileScreen : _buildWithOutLoggedProfileScreen;
  }

  Widget get _buildLoggedProfileScreen{
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
                                .user?.profileImage?.path ==
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
                            style: Get.textTheme.titleLarge
                          ),
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
                        Get.to(() => ProfileUpdateScreen(
                          id: _profileController.user!.id,
                          imgUrl: _profileController.user?.profileImage?.path,
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
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=> const AddressViewScreen(), binding: AddressViewBinding());
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/shipping-address.svg',
                        title: 'Shipping Address',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const MyOrderScreen());
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/my-order.svg',
                        title: 'My Order',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => PrivacyPolicyScreen());
                      },
                      child: const ProfileItemButton(
                        iconUrl: 'assets/images/support.svg',
                        title: 'Privacy Policy',
                      ),
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const HelpAndSupportScreen());
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
                        Get.to(() => const AboutScreen());
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

  Widget get _buildWithOutLoggedProfileScreen{
    return SafeArea(
      child: SizedBox(
        width: double.infinity.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(20.h),
            Text('Welcome To', style: Get.textTheme.titleLarge),
            SvgPicture.asset(
              AppUrls.appLogoSvg,
              height: 86.h,
              width: 110.w
            ),
            Gap(8.h),
            Text('Mart', style: Get.textTheme.titleSmall),
            Gap(32.h),
            Text('Continue Shopping Please Sign In Or Sign Up', style: Get.textTheme.bodyMedium,),
            Gap(16.h),
            CustomOutlinedButton(onPressed: (){
              Get.to(()=> SignInScreen());
            }, buttonName: 'Sign In', buttonWidth: 150.w)
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
              style: Get.textTheme.titleLarge
            ),
          ),
          Gap(20.h),
          Center(
            child: Text(
              'Are you sure want to logout?',
              style: Get.textTheme.bodyLarge
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
                SharedPreferencesService().clearUserData();
                Get.find<MyOrderController>().myOrderList.clear();
                Get.find<AddressViewController>().addressList.clear();
                Get.find<ProductListController>().products.clear();
                Get.find<CartItemController>().cartItems.clear();
                Get.find<WishListItemController>().wishListItems.clear();
                Get.offAll(() => SignInScreen());
              }),
          Gap(32.h)
        ],
      ),
    );
  }
}
