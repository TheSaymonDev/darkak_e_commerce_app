import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppProductSectorCard extends StatefulWidget {
  const AppProductSectorCard({super.key, required this.productList});

  final List<ProductModel> productList;

  @override
  State<AppProductSectorCard> createState() => _AppProductSectorCardState();
}

class _AppProductSectorCardState extends State<AppProductSectorCard> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 318.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final productList = widget.productList[index];
            final discountAmount =
                (productList.productPrice *
                    productList.productDiscount) /
                    100;
            final discountPrice =
                productList.productPrice -
                    discountAmount.toInt();
            return SizedBox(
              height: double.infinity.h,
              width: 180.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
          separatorBuilder: (context, index) => Gap(38.w),
          itemCount:
          widget.productList.length),
    );
  }
}
