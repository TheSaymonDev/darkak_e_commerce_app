import 'package:darkak_e_commerce_app/models/home_categories_model.dart';
import 'package:darkak_e_commerce_app/views/screens/sub_category_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card_style.dart';
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
      height: 95.h,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final categoriesList = Category.categoryList[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(()=>SubCategoryScreen(subCategoryProductList: categoriesList.categoryProductList));
                  },
                  child: CustomCardStyle(
                    isCircle: true,
                    width: 60.w,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.w, vertical: 15.h),
                    child: SvgPicture.asset(
                      categoriesList.categoryImage,
                    ),
                  ),
                ),
                Text(
                  categoriesList.categoryName,
                  style: Get.textTheme.bodyMedium,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => Gap(24.w),
          itemCount: Category.categoryList.length),
    );
  }
}

