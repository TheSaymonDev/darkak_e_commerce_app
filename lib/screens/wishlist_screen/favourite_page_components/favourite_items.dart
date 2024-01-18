import 'package:darkak_e_commerce_app/data/demo_product_list.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/utility.dart';
import 'package:darkak_e_commerce_app/screens/product_details_screen/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({
    super.key,
  });

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
        final productList = demoProductList[index];
          return GestureDetector(
            onTap: (){
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
            child: SizedBox(
              height: 120.h,
              width: double.infinity.w,
              child: Row(
                children: [
                  Container(
                    height: double.infinity.h,
                    width: 120.w,
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(
                        image: AssetImage(demoProductList[index].productImagePath),
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          _unFavouriteItem(index);
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 25.sp,
                        ),
                        color: orangeColor),
                  ),
                  Gap(63.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        demoProductList[index].productName,
                        style: myTextStyle(
                            25.sp, FontWeight.normal, textColor),
                      ),
                      Text(
                        '$takaSign${demoProductList[index].productPrice.toString()}',
                        style: myTextStyle(
                            20.sp, FontWeight.normal, orangeColor),
                      ),
                      Gap(10.h),
                      Row(
                        children: [
                          Text(
                            '500',
                            style: myTextStyle(
                                15.sp, FontWeight.normal, greyColor,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Gap(10.w),
                          Text(
                            '-10%',
                            style: myTextStyle(
                                15.sp, FontWeight.normal, greyColor),
                          ),
                          Gap(68.w),
                          Icon(
                            Icons.star,
                            color: yellowColor,
                            size: 20.sp,
                          ),
                          Text(
                            '4.5',
                            style: myTextStyle(
                                20.sp, FontWeight.normal, textColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Gap(16.h),
        itemCount: demoProductList.length);
  }

  void _unFavouriteItem(int index) {
    demoProductList.removeAt(index);
    setState(() {
    });
  }
}
