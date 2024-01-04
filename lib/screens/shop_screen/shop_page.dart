import 'package:darkak_e_commerce_app/data/demo_product_list.dart';
import 'package:darkak_e_commerce_app/models/product_query_model.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_filtering_and_sorting.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_gridview.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_query_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Gap(16.h),
            const AppSearchTextFormField(),
           Gap(16.h),
           CustomQueryTab(productQueryList: ProductQuery.productQueryList),
            Gap(8.h),
            CustomFilteringAndSorting(filterTap: (){}, sortingTap: (){}),

            Gap(16.h),
            Expanded(
              child: CustomProductItemGridView(
                productList: demoProductList,
                physics: const ScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
