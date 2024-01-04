import 'package:darkak_e_commerce_app/models/cart_product_item_model.dart';
import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/screens/checkout_screens/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          children: [
            Expanded(
             child: SingleChildScrollView(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Gap(16.h),
                    Flexible(
                     child: ListView.separated(
                         scrollDirection: Axis.vertical,
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (context, index) {
                           final cartProductList =
                           CartProductItemModel.cartProductItemList[index];
                           return Slidable(
                             key: ValueKey<CartProductItemModel>(cartProductList),
                             startActionPane: ActionPane(
                               motion: const ScrollMotion(),
                               children: [
                                 SlidableAction(
                                   onPressed: (c) {},
                                   backgroundColor: yellowColor,
                                   foregroundColor: backgroundColor,
                                   icon: Icons.star,
                                 ),
                               ],
                             ),
                             endActionPane: ActionPane(
                               motion: const ScrollMotion(),
                               children: [
                                 SlidableAction(
                                   onPressed: (c) {
                                     deleteCartItem(index);
                                   },
                                   backgroundColor: orangeColor,
                                   foregroundColor: backgroundColor,
                                   icon: Icons.delete,
                                 ),
                               ],
                             ),
                             child: Container(
                               padding: EdgeInsets.symmetric(horizontal: 16.w),
                               height: 120.h,
                               width: double.infinity,
                               child: Row(
                                 children: [
                                   Container(
                                     height: double.infinity.h,
                                     width: 120.w,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(4.r),
                                       image: DecorationImage(
                                         image: AssetImage(cartProductList.productImg),
                                       ),
                                     ),
                                   ),
                                   Gap(70.w),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         cartProductList.productName,
                                         style: myTextStyle(
                                             25.sp, FontWeight.normal, textColor),
                                       ),
                                       Row(
                                         children: [
                                           Text(
                                             '$takaSign${cartProductList.productPrice.toString()}',
                                             style: myTextStyle(20.sp,
                                                 FontWeight.normal, orangeColor),
                                           ),
                                           Gap(60.w),
                                           Text(
                                             'Size: ${cartProductList.productSize}',
                                             style: myTextStyle(
                                                 20.sp, FontWeight.normal, textColor),
                                           ),
                                         ],
                                       ),
                                       Row(
                                         children: List.generate(
                                             5,
                                                 (index) => Icon(
                                               Icons.star,
                                               size: 23.sp,
                                               color: index <
                                                   cartProductList
                                                       .productRating
                                                   ? yellowColor
                                                   : greyColor,
                                             )),
                                       ),
                                       Container(
                                         height: 30.h,
                                         width: 95.w,
                                         alignment: Alignment.center,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(4.r),
                                           color: filledColor,
                                         ),
                                         child: Row(
                                           mainAxisAlignment:
                                           MainAxisAlignment.spaceAround,
                                           children: [
                                             InkWell(
                                               onTap: () {
                                                 decrementQuantity(index);
                                               },
                                               child: Icon(
                                                 Icons.remove,
                                                 color: Colors.grey,
                                                 size: 20.sp,
                                               ),
                                             ),
                                             Text(
                                               cartProductList.productQuantity
                                                   .toString(),
                                               style: myTextStyle(20.sp,
                                                   FontWeight.normal, textColor),
                                             ),
                                             InkWell(
                                               onTap: () {
                                                 incrementQuantity(index);
                                               },
                                               child: Icon(
                                                 Icons.add,
                                                 color: Colors.grey,
                                                 size: 20.sp,
                                               ),
                                             )
                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           );
                         },
                         separatorBuilder: (context, index) => Gap(16.h),
                         itemCount: CartProductItemModel.cartProductItemList.length),
                   ),
                   Gap(32.h),
                   Column(
                     children: [
                       Divider(
                         color: orangeColor,
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16.w),
                         child: SizedBox(
                           height: 50.h,
                           width: double.infinity.w,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text(
                                 'Sub Total',
                                 style:
                                 myTextStyle(20.sp, FontWeight.normal, textColor),
                               ),
                               Text(
                                 '----------------------',
                                 style: myTextStyle(
                                     20.sp, FontWeight.normal, orangeColor),
                               ),
                               Text(
                                 '$takaSign${calculateSubTotal()}',
                                 style:
                                 myTextStyle(20.sp, FontWeight.normal, textColor),
                               )
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16.w),
                         child: SizedBox(
                           height: 50.h,
                           width: double.infinity.w,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text(
                                 'Delivery charge',
                                 style:
                                 myTextStyle(20.sp, FontWeight.normal, textColor),
                               ),
                               Text(
                                 '----------------------',
                                 style: myTextStyle(
                                     20.sp, FontWeight.normal, orangeColor),
                               ),
                               Text(
                                 '${takaSign}50',
                                 style:
                                 myTextStyle(20.sp, FontWeight.normal, textColor),
                               )
                             ],
                           ),
                         ),
                       ),
                       Divider(
                         color: orangeColor,
                       ),
                       Gap(16.h),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16.w),
                         child: SizedBox(
                           height: 50.h,
                           width: double.infinity,
                           child: Row(
                             children: [
                               Expanded(
                                 child: TextFormField(
                                   cursorColor: orangeColor,
                                   style:
                                   myTextStyle(20.sp, FontWeight.normal, textColor),
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), bottomLeft: Radius.circular(4.r)),
                                       borderSide: BorderSide(color: orangeColor, width: 1),
                                     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                                       borderSide: BorderSide(color: orangeColor, width: 1),
                                     ),
                                     hintText: 'Enter Voucher Code',
                                     hintStyle: myTextStyle(
                                         20.sp, FontWeight.normal, greyColor),
                                   ),
                                 ),
                               ),
                               Container(
                                 height: double.infinity.h,
                                 width: 110.w,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                                     border: Border.all(color: orangeColor, width: 1.w)),
                                 child: Text(
                                   'APPLY',
                                   style: myTextStyle(20.sp, FontWeight.bold, textColor),
                                 ),
                               )
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                   Gap(32.h),
                 ],
               ),
             ),
           ),
            Container(
              height: 84.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(0, -3), // Offset for top shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TOTAL',
                        style: myTextStyle(15.sp, FontWeight.normal, Colors.grey),
                      ),
                      Text(
                        '$takaSign${calculateSubTotal()+50}',
                        style: myTextStyle(20.sp, FontWeight.bold, orangeColor),
                      )
                    ],
                  ),
                  const Spacer(),
                  CustomOrangeButton(
                      onPressed: () {
                        Get.to(()=>CheckOutPage());
                      }, buttonName: 'Checkout', width: 146.w)
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  int calculateSubTotal() {
    int subTotal = 0;
    for (var item in CartProductItemModel.cartProductItemList) {
      subTotal += item.productPrice * item.productQuantity;
    }
    return subTotal;

  }

}


