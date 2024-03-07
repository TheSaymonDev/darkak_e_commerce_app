import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/models/demo_product_list.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/product_details_screen.dart';
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
                        color: orangeClr),
                  ),
                  Gap(63.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        demoProductList[index].productName,
                        style: myStyle(
                            25.sp, FontWeight.normal, blackClr),
                      ),
                      Text(
                        '$takaSign${demoProductList[index].productPrice.toString()}',
                        style: myStyle(
                            20.sp, FontWeight.normal, orangeClr),
                      ),
                      Gap(10.h),
                      Row(
                        children: [
                          Text(
                            '500',
                            style: myStyle(
                                15.sp, FontWeight.normal, greyClr,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Gap(10.w),
                          Text(
                            '-10%',
                            style: myStyle(
                                15.sp, FontWeight.normal, greyClr),
                          ),
                          Gap(68.w),
                          Icon(
                            Icons.star,
                            color: yellowClr,
                            size: 20.sp,
                          ),
                          Text(
                            '4.5',
                            style: myStyle(
                                20.sp, FontWeight.normal, blackClr),
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