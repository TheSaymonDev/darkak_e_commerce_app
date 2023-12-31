import 'package:e_commerce_app/data/various_sectors/recommended.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

class RecommendedProductItems extends StatefulWidget {
  const RecommendedProductItems({super.key});

  @override
  State<RecommendedProductItems> createState() => _RecommendedProductItemsState();
}

class _RecommendedProductItemsState extends State<RecommendedProductItems> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 26.h,
      crossAxisSpacing: 38.w,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final productList = recommendedProductList[index];
        final discountAmount =
            (productList.productPrice *
                productList.productDiscount) /
                100;
        final discountPrice =
            productList.productPrice -
                discountAmount.toInt();
        return SizedBox(
          height: 316.h,
          width: 180.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  //Get.to( ProductDetailsPage());
                },
                child: Container(
                  height: 240.h,
                  width: 180.w,
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                          image: AssetImage(
                              productList.imgUrl),
                          fit: BoxFit.cover)),
                  child: IconButton(
                      onPressed: () {
                        productList.toggleFavorite();
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30.sp,
                      ),
                      color:
                      productList.isFavourite == true
                          ? orangeColor
                          : backgroundColor),
                ),
              ),
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
                    color:
                    productList.productRating < 4.5
                        ? greyColor
                        : yellowColor,
                    size: 20.sp,
                  ),
                  Text(
                    productList.productRating
                        .toString(),
                    style: myTextStyle(
                        20.sp, FontWeight.normal, textColor),
                  )
                ],
              ),
            ],
          ),
        );
      },
      itemCount: recommendedProductList.length,
    );
  }
}
