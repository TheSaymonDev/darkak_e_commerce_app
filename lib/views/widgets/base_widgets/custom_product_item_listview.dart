import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/models/product_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/product_details_screen.dart';
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
                (productList.productPrice * productList.discounts) / 100;
            final discountPrice =
                productList.productPrice - discountAmount.toInt();
            return Card(
              color: whiteClr,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Container(
                height: double.infinity.h,
                width: 175.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: whiteClr),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
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
                        ));
                      },
                      child: Container(
                        height: 230.h,
                        width: 184.w,
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
                                shape: BoxShape.circle, color: whiteClr),
                            child: Icon(
                              productList.isFavourite == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 24.sp,
                              color: orangeClr,
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
                            style: myStyle(
                                20.sp, FontWeight.normal, blackClr),
                          ),
                          Text(
                            '$takaSign${productList.productPrice}',
                            style: myStyle(
                                20.sp, FontWeight.normal, orangeClr),
                          ),
                          Row(
                            children: [
                              Text(
                                discountPrice.toString(),
                                style: myStyle(
                                    15.sp, FontWeight.normal, greyClr,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Gap(10.w),
                              Text(
                                '-${productList.discounts.toString()}%',
                                style: myStyle(
                                    15.sp, FontWeight.normal, greyClr),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                color: productList.productRating < 4.5
                                    ? greyClr
                                    : yellowClr,
                                size: 20.sp,
                              ),
                              Text(
                                productList.productRating.toString(),
                                style: myStyle(
                                    20.sp, FontWeight.normal, blackClr),
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
