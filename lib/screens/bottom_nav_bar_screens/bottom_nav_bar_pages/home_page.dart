import 'package:e_commerce_app/models/best_selling_product_model.dart';
import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16.h),
            Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 28.h,
                    width: 28.h,
                    alignment: Alignment.center,
                    decoration: shadowDecoration(),
                    child: Icon(Icons.location_on, size: 15.sp, color: orangeColor,),
                  ),
                ),
                Gap(10.w),
                Text('Location', style: myTextStyle(20.sp, FontWeight.normal, textColor),),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    alignment: Alignment.center,
                    decoration: shadowDecoration(),
                    child: Icon(Icons.notifications, size: 25.sp, color: orangeColor,),
                  ),
                ),
              ],
            ),
            Text('Dhaka North, Banani Road No. 12 - 19', style: myTextStyle(15.sp, FontWeight.normal, greyColor),),
            Gap(16.h),
            Row(
              children: [
                const AppSearchTextFormField(),
                Gap(30.w),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    alignment: Alignment.center,
                    decoration: shadowDecoration(),
                    child: Icon(Icons.filter_list_outlined, size: 25.sp, color: orangeColor,),
                  ),
                )
              ],
            ),
            Gap(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: myTextStyle(25.sp, FontWeight.bold, textColor),
                ),
               Text('See all', style: myTextStyle(20.sp, FontWeight.normal, textColor),)
              ],
            ),
            Gap(16.h),
            SizedBox(
              height: 92.h,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final categoriesList =
                        CategoriesModel.categoriesList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60.h,
                          width: 60.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          alignment: Alignment.center,
                          decoration: shadowDecoration(),
                          child: SvgPicture.asset(
                            categoriesList.iconUrl,
                          ),
                        ),
                        Text(
                          categoriesList.name,
                          style:
                              myTextStyle(20.sp, FontWeight.normal, textColor),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Gap(24.w),
                  itemCount: CategoriesModel.categoriesList.length),
            ),
            Gap(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Selling',
                  style: myTextStyle(25.sp, FontWeight.bold, textColor),
                ),
                Text(
                  'See all',
                  style: myTextStyle(20.sp, FontWeight.normal, textColor),
                ),
              ],
            ),
            Gap(16.h),
            SizedBox(
              height: 318.h,
              width: double.infinity.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final bestSellingProductList =
                        BestSellingProductModel.bestSellingProductList[index];
                    final discountAmount =
                        (bestSellingProductList.productPrice *
                                bestSellingProductList.productDiscount) /
                            100;
                    final discountPrice = bestSellingProductList.productPrice -
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
                                        bestSellingProductList.imgUrl),
                                    fit: BoxFit.cover)),
                            child: IconButton(
                                onPressed: () {
                                  bestSellingProductList.toggleFavorite();
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: 30.sp,
                                ),
                                color:
                                    bestSellingProductList.isFavourite == true
                                        ? orangeColor
                                        : backgroundColor),
                          ),
                          Text(
                            bestSellingProductList.productName,
                            style: myTextStyle(
                                20.sp, FontWeight.normal, textColor),
                          ),
                          Text(
                            '$takaSign${bestSellingProductList.productPrice}',
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
                                '-${bestSellingProductList.productDiscount.toString()}%',
                                style: myTextStyle(
                                    15.sp, FontWeight.normal, greyColor),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                color:
                                    bestSellingProductList.productRating < 4.5
                                        ? greyColor
                                        : yellowColor,
                                size: 20.sp,
                              ),
                              Text(
                                bestSellingProductList.productRating.toString(),
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
                      BestSellingProductModel.bestSellingProductList.length),
            )
          ],
        ),
      ),
    );
  }

}
