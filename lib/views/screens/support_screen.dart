import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
        onPressedBack: () {
          Get.back();
        },
        title: 'Customer Support',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Gap(40.h),
            CustomCard(
              width: double.infinity.w,
              border: Border.all(color: orangeClr, width: 1.w),
              child: Column(
                children: [
                  _buildListTile(
                    onTap: () {},
                    iconPath: 'assets/images/customer_service.svg',
                    title: 'Customer Service',
                  ),
                  Divider(
                    color: orangeClr,
                    thickness: 1.h,
                  ),
                  _buildListTile(
                      onTap: () {},
                      iconPath: 'assets/images/website.svg',
                      title: 'Website'),
                  Divider(
                    color: orangeClr,
                    thickness: 1.h,
                  ),
                  _buildListTile(
                      onTap: () {},
                      iconPath: 'assets/images/linkedin.svg',
                      title: 'Linkedin'),
                  Divider(
                    color: orangeClr,
                    thickness: 1.h,
                  ),
                  _buildListTile(
                      onTap: () {},
                      iconPath: 'assets/images/twitter.svg',
                      title: 'Twitter'),
                  Divider(
                    color: orangeClr,
                    thickness: 1.h,
                  ),
                  _buildListTile(
                      onTap: () {},
                      iconPath: 'assets/images/facebook_2.svg',
                      title: 'Facebook'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile({
    required void Function()? onTap,
    required String title,
    required String iconPath,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      leading: SizedBox(
        height: 30.h,
        width: 30.w,
        child: SvgPicture.asset(iconPath),
      ),
      title: Text(
        title,
        style: myStyle(25.sp, FontWeight.normal, blackClr),
      ),
    );
  }
}
