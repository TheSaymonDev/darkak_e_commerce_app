// import 'package:darkak_e_commerce_app/utils/app_colors.dart';
// import 'package:darkak_e_commerce_app/utils/app_urls.dart';
// import 'package:darkak_e_commerce_app/widgets/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:gap/gap.dart';
//
// class RecommendedProductItems extends StatefulWidget {
//   const RecommendedProductItems({super.key});
//
//   @override
//   State<RecommendedProductItems> createState() => _RecommendedProductItemsState();
// }
//
// class _RecommendedProductItemsState extends State<RecommendedProductItems> {
//   @override
//   Widget build(BuildContext context) {
//     return MasonryGridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       mainAxisSpacing: 26.h,
//       crossAxisSpacing: 38.w,
//       scrollDirection: Axis.vertical,
//       itemBuilder: (context, index) {
//         final productList = demoProductList[index];
//         final discountAmount =
//             (productList.productPrice *
//                 productList.discounts) /
//                 100;
//         final discountPrice =
//             productList.productPrice -
//                 discountAmount.toInt();
//         return SizedBox(
//           height: 316.h,
//           width: 180.w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: (){
//                   //Get.to( ProductDetailsPage());
//                 },
//                 child: Container(
//                   height: 240.h,
//                   width: 180.w,
//                   alignment: Alignment.topRight,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.r),
//                       image: DecorationImage(
//                           image: AssetImage(
//                               productList.productImagePath),
//                           fit: BoxFit.cover)),
//                   child: IconButton(
//                       onPressed: () {
//                         productList.toggleFavorite();
//                         setState(() {});
//                       },
//                       icon: Icon(
//                         Icons.favorite,
//                         size: 30.sp,
//                       ),
//                       color:
//                       productList.isFavourite == true
//                           ? orangeClr
//                           : whiteClr),
//                 ),
//               ),
//               Text(
//                 productList.productName,
//                 style: myStyle(
//                     20.sp, FontWeight.normal, blackClr),
//               ),
//               Text(
//                 '${AppUrls.takaSign}${productList.productPrice}',
//                 style: myStyle(
//                     20.sp, FontWeight.normal, orangeClr),
//               ),
//               Row(
//                 children: [
//                   Text(
//                     discountPrice.toString(),
//                     style: myStyle(
//                         15.sp, FontWeight.normal, greyClr,
//                         decoration: TextDecoration.lineThrough),
//                   ),
//                   Gap(10.w),
//                   Text(
//                     '-${productList.discounts.toString()}%',
//                     style: myStyle(
//                         15.sp, FontWeight.normal, greyClr),
//                   ),
//                   const Spacer(),
//                   Icon(
//                     Icons.star,
//                     color:
//                     productList.productRating < 4.5
//                         ? greyClr
//                         : yellowClr,
//                     size: 20.sp,
//                   ),
//                   Text(
//                     productList.productRating
//                         .toString(),
//                     style: myStyle(
//                         20.sp, FontWeight.normal, blackClr),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//       itemCount: demoProductList.length,
//     );
//   }
// }
