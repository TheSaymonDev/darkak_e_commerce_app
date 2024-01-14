import 'package:darkak_e_commerce_app/data/demo_product_list.dart';
import 'package:darkak_e_commerce_app/models/product_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_searchview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_product_item_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductModel> searchProducts(List<ProductModel> products, String query) {
    return products
        .where((product) =>
            product.productName.toLowerCase().contains(query.toLowerCase()) ||
            product.productID.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<ProductModel> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarSearchviewWithBack(onPressedBack: () {
        Get.back();
      }, onChanged: (query) {
        setState(() {
          filteredProducts = searchProducts(demoProductList, query);
        });
      }),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomProductItemGridView(
          productList: filteredProducts,
          physics: const ScrollPhysics(),
        ),
      ),
    );
  }
}
