import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/screens/category_and_sub_category_screens/category_page/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                InkWell(
                  onTap: (){
                    Get.to(const CategoryPage());
                  },
                  child: Container(
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
                ),
                Text(
                  categoriesList.name,
                  style: myTextStyle(
                      20.sp, FontWeight.normal, textColor),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => Gap(24.w),
          itemCount: CategoriesModel.categoriesList.length),
    );
  }
}
