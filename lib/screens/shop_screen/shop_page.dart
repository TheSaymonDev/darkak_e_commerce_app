import 'package:darkak_e_commerce_app/data/shop_items.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_gridview.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_searchview_with_back.dart';
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
            Gap(8.h),
            Expanded(
              child: CustomProductItemGridView(
                productList: shopProductList,
                physics: const ScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
