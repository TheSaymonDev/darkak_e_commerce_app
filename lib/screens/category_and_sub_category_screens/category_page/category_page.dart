import 'package:e_commerce_app/data/categories_product.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_item_gridview.dart';
import 'package:e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:e_commerce_app/screens/filter_and_sort_screens/filter_page.dart';
import 'package:e_commerce_app/screens/wishlist_screen/favourite_page_components/filter_and_sorting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _currentIndex = 0;

  final List<String> _subCategoryList = [
    'All',
    'T-Shirt',
    'Shirt',
    'Pant',
    'Panjabi'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 25.sp,
            color: orangeColor,
          ),
        ),
        title: const AppSearchTextFormField(),
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Gap(16.h),
            SizedBox(
              height: 80.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                _currentIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                height: double.infinity.h,
                                width: 100.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(color: orangeColor),
                                  color: _currentIndex == index
                                      ? orangeColor
                                      : backgroundColor,
                                ),
                                child: Text(
                                  _subCategoryList[index],
                                  style: myTextStyle(
                                      15.sp,
                                      FontWeight.normal,
                                      _currentIndex == index
                                          ? backgroundColor
                                          : orangeColor),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => Gap(10.w),
                        itemCount: _subCategoryList.length),
                  ),
                  FilterAndSorting(filterTap: (){Get.to(const FilterPage());}, sortingTap: (){})
                ],
              ),
            ),
            Gap(16.h),
            Expanded(
              child: AppItemGridView(productList: categoriesProductList, physics: const ScrollPhysics(),),
            )
          ],
        ),
      ),
    );
  }
}
