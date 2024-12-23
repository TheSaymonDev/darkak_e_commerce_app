import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/models/cart_product_item_model.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final cartProductList =
          CartProductItemModel.cartProductItemList[index];
          // return Slidable(
          //   key: ValueKey<CartProductItemModel>(cartProductList),
          //   startActionPane: ActionPane(
          //     motion: const ScrollMotion(),
          //     children: [
          //       SlidableAction(
          //         onPressed: (c) {},
          //         backgroundColor: yellowClr,
          //         foregroundColor: whiteClr,
          //         icon: Icons.star,
          //       ),
          //     ],
          //   ),
          //   endActionPane: ActionPane(
          //     motion: const ScrollMotion(),
          //     children: [
          //       SlidableAction(
          //         onPressed: (c) {
          //           deleteCartItem(index);
          //         },
          //         backgroundColor: orangeClr,
          //         foregroundColor: whiteClr,
          //         icon: Icons.delete,
          //       ),
          //     ],
          //   ),
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 16.w),
          //     height: 120.h,
          //     width: double.infinity,
          //     child: Row(
          //       children: [
          //         Container(
          //           height: double.infinity.h,
          //           width: 120.w,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(4.r),
          //             image: DecorationImage(
          //               image: AssetImage(cartProductList.productImg),
          //             ),
          //           ),
          //         ),
          //         Gap(70.w),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               cartProductList.productName,
          //               style: myStyle(
          //                   25.sp, FontWeight.normal, blackClr),
          //             ),
          //             Row(
          //               children: [
          //                 Text(
          //                   '${AppUrls.takaSign}${cartProductList.productPrice.toString()}',
          //                   style: myStyle(20.sp,
          //                       FontWeight.normal, orangeClr),
          //                 ),
          //                 Gap(60.w),
          //                 Text(
          //                   'Size: ${cartProductList.productSize}',
          //                   style: myStyle(
          //                       20.sp, FontWeight.normal, blackClr),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: List.generate(
          //                   5,
          //                       (index) => Icon(
          //                     Icons.star,
          //                     size: 23.sp,
          //                     color: index <
          //                         cartProductList
          //                             .productRating
          //                         ? yellowClr
          //                         : greyClr,
          //                   )),
          //             ),
          //             Container(
          //               height: 30.h,
          //               width: 95.w,
          //               alignment: Alignment.center,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(4.r),
          //                 color: filledClr,
          //               ),
          //               child: Row(
          //                 mainAxisAlignment:
          //                 MainAxisAlignment.spaceAround,
          //                 children: [
          //                   InkWell(
          //                     onTap: () {
          //                       decrementQuantity(index);
          //                     },
          //                     child: Icon(
          //                       Icons.remove,
          //                       color: Colors.grey,
          //                       size: 20.sp,
          //                     ),
          //                   ),
          //                   Text(
          //                     cartProductList.productQuantity
          //                         .toString(),
          //                     style: myStyle(20.sp,
          //                         FontWeight.normal, blackClr),
          //                   ),
          //                   InkWell(
          //                     onTap: () {
          //                       incrementQuantity(index);
          //                     },
          //                     child: Icon(
          //                       Icons.add,
          //                       color: Colors.grey,
          //                       size: 20.sp,
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
        separatorBuilder: (context, index) => Gap(16.h),
        itemCount: CartProductItemModel.cartProductItemList.length);
  }

  void deleteCartItem(int index) {
    setState(() {
      CartProductItemModel.cartProductItemList.removeAt(index);
    });
  }

  void incrementQuantity(int index) {
    setState(() {
      CartProductItemModel.cartProductItemList[index].productQuantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (CartProductItemModel.cartProductItemList[index].productQuantity > 1) {
        CartProductItemModel.cartProductItemList[index].productQuantity--;
      }
    });
  }
}
