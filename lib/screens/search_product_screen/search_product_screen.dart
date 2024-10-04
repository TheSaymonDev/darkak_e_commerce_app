// import 'package:darkak_e_commerce_app/screens/shop_screen/models/product_model.dart';
// import 'package:darkak_e_commerce_app/utils/app_colors.dart';
// import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_searchview_with_back.dart';
// import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_item_gridview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class SearchProductScreen extends StatefulWidget {
//   const SearchProductScreen({super.key});
//
//   @override
//   State<SearchProductScreen> createState() => _SearchProductScreenState();
// }
//
// class _SearchProductScreenState extends State<SearchProductScreen> {
//   List<ProductModel> searchProducts(List<ProductModel> products, String query) {
//     return products
//         .where((product) =>
//             product.name!.toLowerCase().contains(query.toLowerCase()) ||
//             product.id!.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
//
//   List<ProductModel> filteredProducts = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     filteredProducts = demoProductList;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteClr,
//       appBar: AppbarSearchviewWithBack(onPressedBack: () {
//         Get.back();
//       }, onChanged: (query) {
//         setState(() {
//           filteredProducts = searchProducts(demoProductList, query);
//         });
//       }),
//       body: Container(
//         height: double.infinity.h,
//         width: double.infinity.w,
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: CustomProductItemGridView(
//           productList: filteredProducts,
//           physics: const ScrollPhysics(),
//         ),
//       ),
//     );
//   }
// }
