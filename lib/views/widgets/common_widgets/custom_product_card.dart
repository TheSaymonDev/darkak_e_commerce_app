import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomProductCard extends StatelessWidget {
  final void Function()? onTap;
  final String? productImgUrl;
  final String? productName;
  final int? productPrice;
  final int? discountPrice;
  final int? discount;
  final String? productRating;
  const CustomProductCard(
      {super.key,
      required this.onTap,
      required this.productImgUrl,
      required this.productName,
      required this.productPrice,
      this.discountPrice,
      this.discount,
      this.productRating});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteClr,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Container(
        height: 324.h,
        width: 184.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: whiteClr),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 230.h,
                width: double.infinity.w,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider('${Urls.imgUrl}$productImgUrl'),
                        fit: BoxFit.cover)),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 8.h, right: 8.w),
                    height: 32.h,
                    width: 32.w,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: whiteClr),
                    child: Icon(
                      Icons.favorite_border,
                      size: 24.sp,
                      color: orangeClr,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName!,
                    style: Get.textTheme.bodyMedium,
                  ),
                  Text(
                    '${Urls.takaSign}$productPrice',
                    style: Get.textTheme.bodyMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        discountPrice.toString(),
                        style: Get.textTheme.bodySmall!.copyWith(
                            color: greyClr,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Gap(10.w),
                      Text(
                        '-${discount.toString()}%',
                        style:
                            Get.textTheme.bodySmall!.copyWith(color: greyClr),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
