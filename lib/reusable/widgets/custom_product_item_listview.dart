import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/screens/product_details_screen/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomProductItemListView extends StatefulWidget {
  const CustomProductItemListView({super.key, required this.productList});

  final List<ProductModel> productList;

  @override
  State<CustomProductItemListView> createState() => _CustomProductItemListViewState();
}

class _CustomProductItemListViewState extends State<CustomProductItemListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 324.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final productList = widget.productList[index];
            final discountAmount =
                (productList.productPrice * productList.productDiscount) / 100;
            final discountPrice =
                productList.productPrice - discountAmount.toInt();
            return Card(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Container(
                height: double.infinity.h,
                width: 184.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: backgroundColor),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ProductDetailsPage(
                            imgUrl: productList.imgUrl,
                            productName: productList.productName,
                            productPrice: productList.productPrice,
                            productDiscount: productList.productDiscount,
                            productRating: productList.productRating));
                      },
                      child: Container(
                        height: 230.h,
                        width: 184.w,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                                image: AssetImage(productList.imgUrl),
                                fit: BoxFit.cover)),
                        child: InkWell(
                          onTap: () {
                            productList.toggleFavorite();
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 8.h, right: 8.w),
                            height: 32.h,
                            width: 32.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: backgroundColor),
                            child: Icon(
                              productList.isFavourite == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 24.sp,
                              color: orangeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productList.productName,
                            style: myTextStyle(
                                20.sp, FontWeight.normal, textColor),
                          ),
                          Text(
                            '$takaSign${productList.productPrice}',
                            style: myTextStyle(
                                20.sp, FontWeight.normal, orangeColor),
                          ),
                          Row(
                            children: [
                              Text(
                                discountPrice.toString(),
                                style: myTextStyle(
                                    15.sp, FontWeight.normal, greyColor,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Gap(10.w),
                              Text(
                                '-${productList.productDiscount.toString()}%',
                                style: myTextStyle(
                                    15.sp, FontWeight.normal, greyColor),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                color: productList.productRating < 4.5
                                    ? greyColor
                                    : yellowColor,
                                size: 20.sp,
                              ),
                              Text(
                                productList.productRating.toString(),
                                style: myTextStyle(
                                    20.sp, FontWeight.normal, textColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(30.w),
          itemCount: widget.productList.length),
    );
  }
}
