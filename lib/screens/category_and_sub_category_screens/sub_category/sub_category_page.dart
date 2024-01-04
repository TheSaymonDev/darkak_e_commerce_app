import 'package:darkak_e_commerce_app/models/home_categories_model.dart';
import 'package:darkak_e_commerce_app/models/product_model.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_searchview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_gridview.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_query_tab.dart';
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
      appBar: AppbarSearchviewWithBack(onPressedBack: (){Get.back();}, onTapSearch: (){}),
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
                 CustomQueryTab(productQueryList: ProductQuery.productQueryList),
                  CustomFilteringAndSorting(filterTap: (){}, sortingTap: (){}),
                ],
              ),
            ),
            Gap(16.h),
            Expanded(
              child: CustomProductItemGridView(
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
