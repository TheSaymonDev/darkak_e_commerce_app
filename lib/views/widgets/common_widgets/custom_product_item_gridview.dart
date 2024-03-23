import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/urls.dart';
import 'package:darkak_e_commerce_app/models/demo_product_model.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/product_details_screen.dart';
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
          color: whiteClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Container(
            height: 324.h,
            width: 184.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: whiteClr),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ProductDetailsScreen(
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
                        decoration: const BoxDecoration(
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList.productName,
                        style: myStyle(20.sp, FontWeight.normal, blackClr),
                      ),
                      Text(
                        '${Urls.takaSign}${productList.productPrice}',
                        style:
                            myStyle(20.sp, FontWeight.normal, orangeClr),
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
      itemCount: widget.productList.length,
    );
  }
}
