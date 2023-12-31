import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/widgets/custom_product_item_gridview.dart';
import 'package:e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:e_commerce_app/reusable/widgets/custom_appbar/appbar_searchview_with_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductListingPage extends StatelessWidget {
  const ProductListingPage({super.key, required this.productList});

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarSearchviewWithBack(onPressedBack: (){
        Get.back();
      }, onTapSearch: (){}),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: Column(
            children: [
              Gap(16.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomProductItemGridView(
                    productList: productList,
                    physics: const ScrollPhysics(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
