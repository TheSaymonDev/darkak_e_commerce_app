import 'package:e_commerce_app/models/all_products.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_item_gridview.dart';
import 'package:e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SubCategoryPage extends StatefulWidget {
  SubCategoryPage({super.key, required this.subCategoryProductList});

  List<SubCategory> subCategoryProductList;

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Concatenate product lists of all subcategories except 'All'
    widget.subCategoryProductList[_currentIndex].subCategoryProductList =
    List<ProductModel>.empty(growable: true); // Initialize an empty list

    for (int i = 1; i < widget.subCategoryProductList.length; i++) {
      widget.subCategoryProductList[_currentIndex].subCategoryProductList +=
          widget.subCategoryProductList[i].subCategoryProductList;
    }
  }

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
                        itemBuilder: (context, index) {
                          return InkWell(
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
                                widget.subCategoryProductList[index]
                                    .subCategoryName,
                                style: myTextStyle(
                                    15.sp,
                                    FontWeight.normal,
                                    _currentIndex == index
                                        ? backgroundColor
                                        : orangeColor),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Gap(10.w),
                        itemCount: widget.subCategoryProductList.length),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Expanded(
              child: AppItemGridView(
                productList: widget.subCategoryProductList[_currentIndex]
                    .subCategoryProductList,
                physics: const ScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
