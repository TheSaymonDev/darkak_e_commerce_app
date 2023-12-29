import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/reusable/widgets/app_item_gridview.dart';
import 'package:e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productList});

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Gap(16.h),
              AppSearchTextFormField(),
              Gap(16.h),
              Expanded(
                child: AppItemGridView(
                  productList: productList,
                  physics: ScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
