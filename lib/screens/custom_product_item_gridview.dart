import 'package:darkak_e_commerce_app/models/product.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/screens/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomProductItemGridView extends StatefulWidget {
  const CustomProductItemGridView(
      {super.key, required this.productList, required this.physics});

  final List<ProductModel> productList;
  final ScrollPhysics physics;

  @override
  State<CustomProductItemGridView> createState() =>
      _CustomProductItemGridViewState();
}

class _CustomProductItemGridViewState extends State<CustomProductItemGridView> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: widget.physics,
      crossAxisCount: 2,
      mainAxisSpacing: 26.h,
      crossAxisSpacing: 30.w,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final productList = widget.productList[index];
        final discountAmount =
            (productList.productPrice * productList.discounts) / 100;
        final discountPrice = productList.productPrice - discountAmount.toInt();
        return Card(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Container(
            height: 324.h,
            width: 184.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: backgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ProductDetailsPage(
                        productImagePath: productList.productImagePath,
                        productName: productList.productName,
                        productPrice: productList.productPrice,
                        productDiscount: productList.discounts,
                        productRating: productList.productRating,
                        attributes: productList.attributes,
                        customerReviews: productList.customerReviews,
                        imagesPath: productList.imagesPath,
                        color: productList.color,
                        productDescription: productList.productDescription,
                        productId: productList.productID,
                      ),
                    );
                  },
                  child: Container(
                    height: 230.h,
                    width: double.infinity.w,
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                            image: AssetImage(productList.productImagePath),
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList.productName,
                        style: myTextStyle(20.sp, FontWeight.normal, textColor),
                      ),
                      Text(
                        '$takaSign${productList.productPrice}',
                        style:
                            myTextStyle(20.sp, FontWeight.normal, orangeColor),
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
                            '-${productList.discounts.toString()}%',
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
      itemCount: widget.productList.length,
    );
  }
}
